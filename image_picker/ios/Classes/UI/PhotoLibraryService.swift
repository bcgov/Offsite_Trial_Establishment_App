import Photos
import PhotosUI

@available(iOS 14.0.0, *)
class PhotoLibraryService: ObservableObject {
    
    var imageCachingManager = PHCachingImageManager()
    @Published var results = PHFetchResultCollection(
        fetchResult: .init()
    )
    @Published var selected: Set<String> = []
    
    init() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.fetchAllPhotos()
        }
    }
    
    private func fetchAllPhotos() {
        imageCachingManager.allowsCachingHighQualityImages = false
        let fetchOptions = PHFetchOptions()
        fetchOptions.includeHiddenAssets = false
        fetchOptions.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        DispatchQueue.main.async {
            self.results.fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
            print("result \(self.results.fetchResult.count)")
        }
    }
    
    func fetchImage(
        byLocalIdentifier localId: String,
        callback: @escaping (UIImage?) -> Void
    ) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            let results = PHAsset.fetchAssets(
                withLocalIdentifiers: [localId],
                options: nil
            )
            guard let asset = results.firstObject else {
                callback(nil)
                return
            }
            let options = PHImageRequestOptions()
            options.deliveryMode = .opportunistic
            options.resizeMode = .fast
            options.isNetworkAccessAllowed = true
            options.isSynchronous = true
            self?.imageCachingManager.requestImage(
                for: asset,
                targetSize: PHImageManagerMaximumSize,
                contentMode: .default,
                options: options,
                resultHandler: { image, info in
                    DispatchQueue.main.async {
                        callback(image)
                    }
                }
            )
        }
    }
    
    func fetchImagesWithMetadata(
        byLocalIdentifiers localIds: [String],
        callback: @escaping ([Data]) -> Void
    ) {
        Task {
            let images = await withTaskGroup(of: Data?.self) { group in
                for localId in localIds {
                    group.addTask {
                        let image = await self.fetchImageWithMetadata(byLocalIdentifier: localId)
                        return image
                    }
                }
                
                var images = [Data]()
                
                for await image in group {
                    if let image {
                        images.append(image)
                    }
                }
                
                return images
            }
            callback(images)
        }
    }
    
    private func fetchImageWithMetadata(
        byLocalIdentifier localId: String
    ) async -> Data? {
        return await withCheckedContinuation({ continuation in
            DispatchQueue.global(qos: .background).async { [weak self] in
                let results = PHAsset.fetchAssets(
                    withLocalIdentifiers: [localId],
                    options: nil
                )
                guard let asset = results.firstObject else {
                    continuation.resume(returning: nil)
                    return
                }
                let options = PHImageRequestOptions()
                options.deliveryMode = .opportunistic
                options.resizeMode = .fast
                options.isNetworkAccessAllowed = true
                options.isSynchronous = true
                self?.imageCachingManager.requestImageDataAndOrientation(
                    for: asset,
                    options: options,
                    resultHandler: { data, _, _, _ in
                        DispatchQueue.main.async {
                            continuation.resume(returning: data)
                        }
                    }
                )
            }
        })
    }
}
