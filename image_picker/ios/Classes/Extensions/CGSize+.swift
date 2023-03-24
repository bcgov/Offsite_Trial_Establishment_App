import Foundation

extension CGSize {
    func scale(factor: CGFloat) -> CGSize{
        .init(width: width * factor, height: height * factor)
    }
}
