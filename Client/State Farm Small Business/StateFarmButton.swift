//
//  Button.swift
//  State Farm Small Business
//
//  Created by Pramith Prasanna on 11/4/23.
//

import UIKit

class StateFarmButton: UIButton {
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupButton()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupButton()
        }

        private func setupButton() {
            // Customize the button here
            self.backgroundColor = UIColor(hex: 0xFF5C5C)
            self.setTitleColor(.white, for: .normal)
            self.layer.cornerRadius = 10 // You can adjust the corner radius as needed
        }
}

extension UIColor {
    convenience init(hex: Int) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}
    
