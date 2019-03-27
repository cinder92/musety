//
//  PXImageService.swift
//  MercadoPagoSDK
//
//  Created by AUGUSTO COLLERONE ALFONSO on 5/3/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import Foundation

final class PXImageService: NSObject {

    class func getIconImageFor(paymentMethod: PXPaymentMethod) -> UIImage? {

        guard paymentMethod.paymentTypeId != PXPaymentTypes.PAYMENT_METHOD_PLUGIN.rawValue else {
            return paymentMethod.getImageForExtenalPaymentMethod()
        }

        let path = ResourceManager.shared.getBundle()!.path(forResource: "PaymentMethodSearch", ofType: "plist")
        let dictPM = NSDictionary(contentsOfFile: path!)

        if let pm = dictPM?.value(forKey: paymentMethod.id) as? NSDictionary {
            return ResourceManager.shared.getImage(pm.object(forKey: "image_name") as? String ?? nil)
        } else if let pmPt = dictPM?.value(forKey: paymentMethod.id + "_" + paymentMethod.paymentTypeId) as? NSDictionary {
            return ResourceManager.shared.getImage(pmPt.object(forKey: "image_name") as? String ?? nil)
        }

        return nil
    }
}
