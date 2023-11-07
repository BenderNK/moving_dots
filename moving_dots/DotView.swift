//
//  DotView.swift
//  moving_dots
//
//  Created by Deniz Nessa on 11/7/23.
//

import UIKit

@IBDesignable
class DotView: UIView {
    @IBInspectable
    var cornerRadius: CGFloat = .zero {
        didSet {
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
            self.layer.cornerRadius = self.cornerRadius
            self.clipsToBounds = true
        }
    }
}
