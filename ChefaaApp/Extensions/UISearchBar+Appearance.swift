import UIKit

extension UISearchBar {

    var textField: UITextField? {
        return value(forKey: "searchField") as? UITextField
    }
    
    var textColor: UIColor? {
        set {
            textField?.textColor = newValue
        }
        get {
            return textField?.textColor
        }
    }

    func setTextFieldBackgroundColor(_ color: UIColor) {
        guard let textField = textField else { return }
        switch searchBarStyle {
        case .minimal:
            textField.layer.backgroundColor = color.cgColor
            textField.layer.cornerRadius = 12
        case .prominent, .default:
            textField.backgroundColor = color
        @unknown default:
            break
        }
    }
    
}
