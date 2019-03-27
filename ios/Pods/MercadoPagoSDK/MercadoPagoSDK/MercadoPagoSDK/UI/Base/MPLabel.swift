//
//  MPLabel.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 3/28/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

internal class MPLabel: UILabel {

    static let defaultColorText = UIColor(red: 51, green: 51, blue: 51)
    static let highlightedColorText = UIColor(red: 51, green: 51, blue: 51)
    static let errorColorText = UIColor(red: 51, green: 51, blue: 51)

    override init(frame: CGRect) {
        super.init(frame: frame)

        if self.font != nil {
            self.font = Utils.getFont(size: self.font!.pointSize)

        }
     }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        if self.font != nil {
            self.font = Utils.getFont(size: self.font!.pointSize)

        }
    }

    func addCharactersSpacing(_ spacing: CGFloat) {
        let attributedString = NSMutableAttributedString()
        if self.attributedText != nil {
            attributedString.append(self.attributedText!)
        }
        attributedString.addAttribute(NSAttributedStringKey.kern, value: spacing, range: NSRange(location: 0, length: self.attributedText!.length))
        self.attributedText = attributedString
    }

    func addLineSpacing(_ lineSpacing: Float, centered: Bool = true) {
        let attributedString = NSMutableAttributedString()
        if self.attributedText != nil {
            attributedString.append(self.attributedText!)
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(lineSpacing)
        if centered {
            paragraphStyle.alignment = .center
        }
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
}
