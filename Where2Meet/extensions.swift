//
//  extensions.swift
//  Where2Meet
//
//  Created by Rebekah Li on 2/1/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func applyDesign() {
        //self.backgroundColor = UIColor.darkGray.withAlphaComponent(1)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = self.frame.height / 4 // Rounds corners completely.
    }
    
    func roundButton() {
        self.layer.cornerRadius = self.frame.height / 2 // Rounds corners completely.
        self.clipsToBounds = true
    }
    func loadingIndicator(_ show: Bool) {
        let tag = 808404
        if show {
            self.isEnabled = false
            self.alpha = 0.5
            self.setTitle("", for: .normal)
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
            indicator.tag = tag
            indicator.color = UIColor.black
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            self.isEnabled = true
            self.alpha = 1.0
            self.setTitle("Choose Image", for: .normal)
            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
    }
    
    static var red: UIColor {
        return UIColor(red: 253, green: 135, blue: 104)
    }
    
    static var orange: UIColor {
        return UIColor(red: 255, green: 149, blue: 0)
    }
    
    static var yellow: UIColor {
        return UIColor(red: 255, green: 204, blue: 0)
    }
    
    static var green: UIColor {
        return UIColor(red: 76, green: 217, blue: 100)
    }
    
    static var tealBlue: UIColor {
        return UIColor(red: 90, green: 200, blue: 250)
    }
    
    static var blue: UIColor {
        return UIColor(red: 0, green: 122, blue: 255)
    }
    
    static var purple: UIColor {
        return UIColor(red: 88, green: 86, blue: 214)
    }
    
    static var pink: UIColor {
        return UIColor(red: 255, green: 45, blue: 85)
    }
    
    static let colors: [UIColor] = [.red, .orange, .yellow, .green, .tealBlue, .blue, .purple, .pink]
    
}
