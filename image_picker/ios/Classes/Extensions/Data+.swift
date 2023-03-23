import Foundation

extension Data {
    func fixOrientation(compress smallSideCompressParam: Int?) -> Data {
        if let image = UIImage(data: self) {
            if let data = image.fixOrientation(compress: smallSideCompressParam).jpegData(compressionQuality: 1.0) {
                return data
            }
        }
        return self
    }
}
