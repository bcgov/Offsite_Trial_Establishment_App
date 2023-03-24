import Flutter
import PhotosUI
import UIKit
import Photos
import SwiftUI

public class SwiftImagePickerPlugin: NSObject, FlutterPlugin, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    
    
    private var result: FlutterResult?
    private var smallSideCompress: Int?
    private var controller: UIViewController?
    private var pickerController: UIViewController?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: .methodChannel, binaryMessenger: registrar.messenger())
        let instance = SwiftImagePickerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch (call.method) {
        case .pickImageMethod:
            let smallSideCompress = (call.arguments as? [String: Any])?[.smallSideCompressParam] as? Int
            pickImage(smallSideCompress: smallSideCompress, result: result)
            break
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    // UIImagePickerController cannot get more than one image
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let url = info[UIImagePickerController.InfoKey.referenceURL] as? NSURL {
            let fetchOptions = PHFetchOptions()
            fetchOptions.includeHiddenAssets = false
            fetchOptions.sortDescriptors = [
                NSSortDescriptor(key: "creationDate", ascending: false)
            ]
            pickerController?.dismiss(animated: true)
            pickerController = nil
            if let urls = URL(string: url.relativeString) {
                let fetchResult = PHAsset.fetchAssets(withALAssetURLs: [urls], options: fetchOptions)
                if let photo = fetchResult.firstObject {
                    let options = PHImageRequestOptions()
                    options.deliveryMode = .opportunistic
                    options.resizeMode = .fast
                    options.isNetworkAccessAllowed = true
                    options.isSynchronous = true
                    PHCachingImageManager().requestImageData(
                        for: photo,
                        options: options,
                        resultHandler: { data, _, _, _ in
                            DispatchQueue.main.async { [weak self] in
                                if let data {
                                    self?.result?([String.permissionParam: PermissionType.granted.rawValue, String.imagesParam: [FlutterStandardTypedData(bytes: data.fixOrientation(compress: self?.smallSideCompress))]])
                                } else {
                                    self?.result?([String.permissionParam: PermissionType.granted.rawValue])
                                }
                            }
                        }
                    )
                    return
                }
            }
        }
        result?([String.permissionParam: PermissionType.granted.rawValue])
    }
    
    @available(iOS 14.0, *)
    public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: .none)
        if results.isEmpty {
            result?([String.permissionParam: PermissionType.granted.rawValue])
        }
        Task {
            let images = await withTaskGroup(of: FlutterStandardTypedData?.self) { group in
                for result in results {
                    group.addTask {
                        let image = await self.loadImage(for: result)
                        return image
                    }
                }
                var images = [FlutterStandardTypedData]()
                for await image in group {
                    if let image {
                        images.append(image)
                    }
                }
                return images
            }
            DispatchQueue.main.async { [weak self] in
                self?.result?([String.permissionParam: PermissionType.granted.rawValue, String.imagesParam: images])
            }
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        result?([String.permissionParam: PermissionType.granted.rawValue])
    }
    
    private func pickImage(smallSideCompress: Int?, result: @escaping FlutterResult) {
        requestPermission(result: result) { [weak self]status in
            self?.showSheetController(smallSideCompress: smallSideCompress, status: status, result: result)
        }
    }
    
    private func requestPermission(result: @escaping FlutterResult, onGranted: @escaping (PermissionType) -> Void) {
        if #available(iOS 14, *) {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { [weak self] (status) in
                DispatchQueue.main.async { [weak self] in
                    switch (status) {
                    case .notDetermined:
                        self?.requestPermission(result: result, onGranted: onGranted)
                    case .authorized:
                        onGranted(.granted)
                    case .limited:
                        onGranted(.limited)
                    default:
                        result([String.permissionParam: PermissionType.deniedForever.rawValue])
                    }
                }
            }
        } else {
            PHPhotoLibrary.requestAuthorization() { [weak self] (status) in
                DispatchQueue.main.async { [weak self] in
                    switch (status) {
                    case .notDetermined:
                        self?.requestPermission(result: result, onGranted: onGranted)
                    case .authorized:
                        onGranted(.granted)
                    default:
                        result([String.permissionParam: PermissionType.deniedForever.rawValue])
                    }
                }
            }
        }
    }
    
    private func showSheetController(smallSideCompress: Int?, status: PermissionType, result: @escaping FlutterResult) {
        self.result = result
        self.smallSideCompress = smallSideCompress
        if status == .limited {
            // limited access to gallery added in iOS 14
            if #available(iOS 14.0, *) {
                let photoService = PhotoLibraryService()
                let topController = getTopController()
                let pickerController = UIHostingController(
                    rootView: LimitedGalleryView(
                        photoLibraryService: photoService,
                        onAddPhoto: { [weak self] in
                            self?.controller?.dismiss(animated: true)
                            if let controller = topController {
                                PHPhotoLibrary.shared().presentLimitedLibraryPicker(from: controller)
                            }
                            result([String.permissionParam: PermissionType.limited.rawValue])
                        },
                        onSelectedPhoto: { [weak self] asset in
                            self?.controller?.dismiss(animated: true)
                            photoService.fetchImagesWithMetadata(byLocalIdentifiers: asset) { data in
                                result([String.permissionParam: PermissionType.limited.rawValue, String.imagesParam: data.map{FlutterStandardTypedData(bytes: $0.fixOrientation(compress: self?.smallSideCompress))}])
                            }
                        }
                    )
                )
                pickerController.modalPresentationStyle = .formSheet
                controller = pickerController
                topController?.present(pickerController, animated: true, completion: nil)
            }
        } else {
            if #available(iOS 14.0, *) {
                var phPickerConfig = PHPickerConfiguration(photoLibrary: .shared())
                phPickerConfig.selectionLimit = 0
                phPickerConfig.filter = PHPickerFilter.any(of: [.images, .livePhotos])
                let phPickerVC = PHPickerViewController(configuration: phPickerConfig)
                phPickerVC.delegate = self
                getTopController()?.present(phPickerVC, animated: true)
            } else {
                let pickerController = UIImagePickerController()
                pickerController.sourceType = .photoLibrary
                pickerController.delegate = self
                getTopController()?.present(pickerController, animated: true, completion: nil)
            }
        }
    }
    
    private func getTopController() -> UIViewController? {
        for window in UIApplication.shared.windows {
            if window.isKeyWindow {
                var result = window.rootViewController
                while (result?.presentedViewController != nil) {
                    result = result?.presentedViewController
                }
                return result
            }
        }
        return nil
    }
    
    @available(iOS 14.0, *)
    private func loadImage(for result: PHPickerResult) async -> FlutterStandardTypedData? {
        return await withCheckedContinuation({ continuation in
            result.itemProvider.loadDataRepresentation(forTypeIdentifier: UTType.image.identifier) { [weak self] data, error in
                if let data {
                    continuation.resume(returning: FlutterStandardTypedData(bytes: data.fixOrientation(compress: self?.smallSideCompress)))
                } else {
                    continuation.resume(returning: nil)
                }
            }
        })
    }
}
