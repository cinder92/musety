//
//  PXPaymentMethodSearch+Business.swift
//  MercadoPagoSDKV4
//
//  Created by Eden Torres on 03/09/2018.
//

import Foundation

internal extension PXPaymentMethodSearch {

    func getPaymentOptionsCount() -> Int {
        let customOptionsCount = customOptionSearchItems.count
        let groupsOptionsCount = paymentMethodSearchItem.count
        return customOptionsCount + groupsOptionsCount
    }

    func hasCheckoutDefaultOption() -> Bool {
        return oneTap != nil
    }

    func deleteCheckoutDefaultOption() {
        oneTap = nil
    }
}
