//
//  Extensions.swift
//  Usefull_Extensions
//
//  Created by Burak AKCAN on 5.06.2023.
//

import UIKit
import Kingfisher

// MARK: - UIView Extensions

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func addShadow(color: UIColor,
                   opacity: Float,
                   offset: CGSize,
                   radius: CGFloat)
    {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.cornerRadius = radius
    }
}


// MARK: - ImageView Extension

extension UIImageView {
    func setImage(with imgUrl: String) {
        let urlString = imgUrl
        guard let url = URL(string: urlString) else { return }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}



// MARK: - UITextField Extension

extension UITextField {
    func turkishText() -> String? {
        guard let text = self.text else {return nil}
        let turkishText = text
            .replacingOccurrences(of: " ", with: "+")
            .replacingOccurrences(of: "ı", with: "i")
            .replacingOccurrences(of: "ş", with: "s")
            .replacingOccurrences(of: "ç", with: "c")
            .replacingOccurrences(of: "ğ", with: "g")
            .replacingOccurrences(of: "ö", with: "o")
            .replacingOccurrences(of: "ü", with: "u")
            .replacingOccurrences(of: "I", with: "İ")
            .replacingOccurrences(of: "Ş", with: "S")
            .replacingOccurrences(of: "Ç", with: "C")
            .replacingOccurrences(of: "Ğ", with: "G")
            .replacingOccurrences(of: "Ö", with: "O")
            .replacingOccurrences(of: "Ü", with: "U")
        return turkishText
    }
}



// MARK: - UIViewController Extension

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func presentBottomAlert(title: String, message: String, okTitle: String, cancelTitle: String, okAction: @escaping () -> Void) {
        let alert = UIAlertController(title: NSLocalizedString(title, comment: ""), message: NSLocalizedString(message, comment: ""), preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: NSLocalizedString(okTitle, comment: ""), style: .default) { _ in
            okAction()
        }
        
        let cancelAction = UIAlertAction(title: NSLocalizedString(cancelTitle, comment: ""), style: .destructive, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}


// MARK: - String Extension

extension String {
    
    func asURL() -> URL? {
        return URL(string: self)
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var isNillOrEmpty: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty != false
    }
}

// MARK: - Date Extension

extension Date {
    func formattedString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}

extension UIColor {
    static func RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    
    static func RGBA(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

