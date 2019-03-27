//
//  PXItem+Business.swift
//  MercadoPagoSDKV4
//
//  Created by Eden Torres on 04/09/2018.
//

import Foundation
extension PXItem {

    // MARK: Validation.
    /**
     Validation based on quantity. If item quantity > 0, the item should be valid and the string response should be nil.
     */
    func validate() -> String? {
        if quantity <= 0 {
            return "La cantidad de items no es valida".localized
        }
        return nil
    }
}
