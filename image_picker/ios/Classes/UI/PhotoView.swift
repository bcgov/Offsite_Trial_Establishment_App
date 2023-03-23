import SwiftUI
import Photos
import PhotosUI

@available(iOS 14.0.0, *)
struct PhotoView: View {
    @State private var image: Image?
    var photoLibraryService: PhotoLibraryService
    private var isSelected: Bool
    
    private var assetLocalId: String
    
    init(assetLocalId: String, photoLibraryService: PhotoLibraryService, isSelected: Bool) {
        self.assetLocalId = assetLocalId
        self.photoLibraryService = photoLibraryService
        self.isSelected = isSelected
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let image = image {
                GeometryReader { proxy in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.width
                        )
                        .clipped()
                }
                .aspectRatio(1, contentMode: .fit)
                .opacity(isSelected ? 0.7 : 1)
            } else {
                Rectangle()
                    .foregroundColor(.white)
                    .aspectRatio(1, contentMode: .fit)
                ProgressView()
            }
            if isSelected {
                Image(systemName: "checkmark.circle")
                    .background(Circle().foregroundColor(Color.blue))
                    .foregroundColor(.white)
                    .padding(4)
            }
        }
        .onAppear {
            loadImageAsset()
        }
        .onDisappear {
            image = nil
        }
    }
    
    func loadImageAsset() {
        photoLibraryService.fetchImage(byLocalIdentifier: assetLocalId) {
            if let uiImage = $0 {
                image = Image(uiImage: uiImage)
            }
        }
    }
}

