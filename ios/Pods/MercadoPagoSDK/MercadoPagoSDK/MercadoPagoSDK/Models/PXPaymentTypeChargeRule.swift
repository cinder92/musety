//
//  PXPaymentTypeChargeRule.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 13/6/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import UIKit

/**
Use this object to make a charge related to any payment method. The relationship is by `paymentMethodId`. You can especify a default `amountCharge` for each payment method.
 */ 
@objc
public final class PXPaymentTypeChargeRule: NSObject {
    let paymentMethdodId: String
    let amountCharge: Double

    // MARK: Init.
    /**
     - parameter paymentMethdodId: Payment method id.
     - parameter amountCharge: Amount charge for the current payment method.
     */
   @objc public init(paymentMethdodId: String, amountCharge: Double) {
        self.paymentMethdodId = paymentMethdodId
        self.amountCharge = amountCharge
        super.init()
    }
}
