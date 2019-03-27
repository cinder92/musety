//
//  MPButton.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 3/28/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

@objcMembers
internal class MPButton: UIButton {

    var actionLink: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        if self.titleLabel != nil {
            if self.titleLabel!.font != nil {
                self.titleLabel!.font = Utils.getFont(size: self.titleLabel!.font.pointSize)
            }
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if self.titleLabel != nil {
            if self.titleLabel!.font != nil {
                self.titleLabel!.font = Utils.getFont(size: self.titleLabel!.font.pointSize)
            }
        }
    }

}
