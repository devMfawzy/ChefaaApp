import Foundation
import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(rgb: Int, alpha: CGFloat = 1) {
        self.init(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF, alpha: alpha)
    }
    
    convenience init(hex: String, alpha: CGFloat = 1) {
        var hex: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if (hex.hasPrefix("#")) {
            let index1 = hex.index(hex.startIndex, offsetBy: 1)
            hex = String(hex[index1...])
        }
        let hexInt = Int(hex, radix: 16) ?? 0
        self.init(rgb: hexInt, alpha: alpha)
    }
    
    class var chefaaGreen: UIColor {
        return UIColor(hex: "#00CD7C")
    }
    
    class var chefaaBabyblue: UIColor {
        return UIColor(hex: "#00AEEF")
    }
    
    class var textGray: UIColor {
        return UIColor(hex: "#878787")
    }
    
    class var inputGray: UIColor {
        return UIColor(hex: "#EAEAEA")
    }
    
}
