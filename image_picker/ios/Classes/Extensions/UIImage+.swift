import UIKit

extension UIImage {
    func fixOrientation(compress smallSideCompressParam: Int?) -> UIImage {
        if self.imageOrientation == .up {
            return self
        }
        let scaleFactor = smallSideCompressParam != nil ? 1 / max(1, min(self.size.width, self.size.height) / CGFloat(smallSideCompressParam!)) : 1
        UIGraphicsBeginImageContextWithOptions(self.size.scale(factor: scaleFactor), false, self.scale)
        self.draw(in: CGRectMake(0, 0, self.size.width * scaleFactor, self.size.height * scaleFactor))
        if let normalizedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return normalizedImage
        }
        UIGraphicsEndImageContext()
        return self
    }
}
