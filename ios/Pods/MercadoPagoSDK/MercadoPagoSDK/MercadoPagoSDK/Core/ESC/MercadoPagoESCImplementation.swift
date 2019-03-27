//
//  MercadoPagoESCImplementation.swift
//  MercadoPagoSDK
//
//  Created by Eden Torres on 7/21/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation

#if PX_PRIVATE_POD
    import MLESCManager
#endif

@objcMembers
internal class MercadoPagoESCImplementation: NSObject, MercadoPagoESC {

    private var isESCEnabled: Bool = false

    init(enabled: Bool) {
        isESCEnabled = enabled
    }

    func hasESCEnable() -> Bool {
        #if PX_PRIVATE_POD
            return isESCEnabled
         #else
            return false
         #endif
    }

    func getESC(cardId: String) -> String? {
        if hasESCEnable() {
            #if PX_PRIVATE_POD
                let esc = ESCManager.getESC(cardId: cardId)
                return String.isNullOrEmpty(esc) ? nil : esc
            #endif
        }
        return nil
    }

    func saveESC(cardId: String, esc: String) -> Bool {
        if hasESCEnable() {
            #if PX_PRIVATE_POD
               return ESCManager.saveESC(cardId: cardId, esc: esc)
            #endif
        }
        return false
    }

    func deleteESC(cardId: String) {
        if hasESCEnable() {
            #if PX_PRIVATE_POD
                ESCManager.deleteESC(cardId: cardId)
            #endif
        }
    }

    func deleteAllESC() {
        if hasESCEnable() {
            #if PX_PRIVATE_POD
                ESCManager.deleteAllESC()
            #endif
        }
    }

    func getSavedCardIds() -> [String] {
        if hasESCEnable() {
            #if PX_PRIVATE_POD
               return ESCManager.getSavedCardIds()
            #endif
        }
        return []
    }
}
