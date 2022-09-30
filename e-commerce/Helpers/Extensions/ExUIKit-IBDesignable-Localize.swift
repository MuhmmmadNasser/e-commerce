//
//  ExUIKit-IBDesinable-Localize.swift
//  e-commerce
//
//  Created by Mohamed on 26/09/2022.
//

import UIKit

@IBDesignable public extension UILabel {
    @IBInspectable var localizeKey: String? {
        get {
            return self.text
        } set {
            return self.text = newValue?.localized
        }
    }
    
}

@IBDesignable public extension UIButton {
    @IBInspectable var localizeKey: String? {
        get {
            return self.titleLabel?.text
        } set {
            return self.setTitle(newValue?.localized, for: .normal)
        }
    }
}


