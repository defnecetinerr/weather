//
//  UIViewExtension.swift
//  weatherProject
//
//  Created by Defne Çetiner on 30.04.2023.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
