//
//  PaymentTracker.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 6/13/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

internal extension MPXTracker {

    internal static func trackToken(token: String) {

        let obj: [String: Any] = ["public_key": MPXTracker.sharedInstance.getPublicKey(), "token": token, "sdk_flavor": "3", "sdk_platform": "iOS", "sdk_type": "native", "sdk_version": MPXTracker.sharedInstance.getSdkVersion(), "sdk_framework": ""]

        let jsonData: Data? = try? JSONSerialization.data(withJSONObject: obj)

        let service = MercadoPagoService(baseURL: "https://api.mercadopago.com/v1")
        service.request(uri: "/checkout/tracking", params: nil, body: jsonData, method: .post, success: { (_) in

        }, failure: nil)

    }

    internal static func trackPaymentOff(paymentId: String) {

        let obj: [String: Any] = ["public_key": MPXTracker.sharedInstance.getPublicKey(), "payment_id": paymentId, "sdk_flavor": "3", "sdk_platform": "iOS", "sdk_type": "native", "sdk_version": MPXTracker.sharedInstance.getSdkVersion(), "sdk_framework": ""]

        let jsonData: Data? = try? JSONSerialization.data(withJSONObject: obj)

        let service = MercadoPagoService(baseURL: "https://api.mercadopago.com/v1")
        service.request(uri: "/checkout/tracking/off", params: nil, body: jsonData, method: .post, success: { (_) in

        }, failure: nil)
    }
}
