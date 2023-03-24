import SwiftUI
import Photos
import PhotosUI

@available(iOS 14.0.0, *)
struct LimitedGalleryView: View {
    @ObservedObject var photoLibraryService: PhotoLibraryService
    var onAddPhoto: () -> Void
    var onSelectedPhoto: ([String]) -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    onSelectedPhoto([])
                }
                Spacer()
                Text("Photos").bold()
                Spacer()
                Button {
                    onSelectedPhoto(Array(photoLibraryService.selected))
                } label: {
                    Text("Add").bold()
                }
                .buttonStyle(.automatic)
                .disabled(photoLibraryService.selected.isEmpty)
            }.padding()
            ScrollView {
                HStack {
                    Text("You've given access to a selected number photos")
                    Spacer(minLength: 16)
                    Button {
                        onAddPhoto()
                    } label: {
                        Text("Manage")
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.12))
                LazyVGrid(
                    columns: Array(
                        repeating: .init(.adaptive(minimum: 100), spacing: 1),
                        count: 3
                    ),
                    spacing: 1
                ) {
                    ForEach(photoLibraryService.results, id: \.self) { asset in
                        Button {
                            if photoLibraryService.selected.contains(asset.localIdentifier) {
                                photoLibraryService.selected.remove(asset.localIdentifier)
                            } else {
                                photoLibraryService.selected.insert(asset.localIdentifier)
                            }
                        } label: {
                            PhotoView(assetLocalId: asset.localIdentifier, photoLibraryService: photoLibraryService, isSelected: photoLibraryService.selected.contains(asset.localIdentifier))
                        }
                    }
                }.padding(0)
            }
            
        }
    }
}
