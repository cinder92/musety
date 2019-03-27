//
//  MercadoPagoCheckoutViewModel+Plugins.swift
//  MercadoPagoSDK
//
//  Created by Eden Torres on 12/14/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation

internal extension MercadoPagoCheckoutViewModel {

    func needToShowPaymentMethodConfigPlugin() -> Bool {
        guard let paymentMethodPluginSelected = paymentOptionSelected as? PXPaymentMethodPlugin else {
            return false
        }

        if wasPaymentMethodConfigPluginShowed() {
            return false
        }

        populateCheckoutStore()

        if let shouldSkip = paymentMethodPluginSelected.paymentMethodConfigPlugin?.shouldSkip(store: PXCheckoutStore.sharedInstance) {
            return !shouldSkip
        }

        return paymentMethodPluginSelected.paymentMethodConfigPlugin != nil
    }

    func needToCreatePaymentForPaymentMethodPlugin() -> Bool {
        return needToCreatePayment() && self.paymentOptionSelected is PXPaymentMethodPlugin
    }

    func wasPaymentMethodConfigPluginShowed() -> Bool {
        return paymentMethodConfigPluginShowed
    }

    func willShowPaymentMethodConfigPlugin() {
        paymentMethodConfigPluginShowed = true
    }

    func resetPaymentMethodConfigPlugin() {
        paymentMethodConfigPluginShowed = false
    }

    func paymentMethodPluginToPaymentMethod(plugin: PXPaymentMethodPlugin) {
        let paymentMethod = PXPaymentMethod(additionalInfoNeeded: nil, id: plugin.getId(), name: plugin.getTitle(), paymentTypeId: PXPaymentMethodPlugin.PAYMENT_METHOD_TYPE_ID, status: nil, secureThumbnail: nil, thumbnail: nil, deferredCapture: nil, settings: [], minAllowedAmount: nil, maxAllowedAmount: nil, accreditationTime: nil, merchantAccountId: nil, financialInstitutions: financialInstitutions, description: plugin.paymentMethodPluginDescription)
            paymentMethod.setExternalPaymentMethodImage(externalImage: plugin.getImage())
        self.paymentData.paymentMethod = paymentMethod
    }
}

// MARK: Payment Plugin
internal extension MercadoPagoCheckoutViewModel {
    func needToCreatePaymentForPaymentPlugin() -> Bool {
        if paymentPlugin == nil {
            return false
        }
        populateCheckoutStore()
        paymentPlugin?.didReceive?(checkoutStore: PXCheckoutStore.sharedInstance)
        if let shouldSupport = paymentPlugin?.support() {
            return shouldSupport
        }
        return needToCreatePayment()
    }
}
