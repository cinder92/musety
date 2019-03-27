//
//  PXIssuer+Business.swift
//  MercadoPagoSDKV4
//
//  Created by Eden Torres on 30/07/2018.
//

import Foundation

extension PXIssuer: Cellable {
    var objectType: ObjectTypes {
        get {
            return ObjectTypes.issuer
        }
        set {
            self.objectType = ObjectTypes.issuer
        }
    }
}
