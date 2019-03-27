//
//  OneTapFlow+PaymentFlow.swift
//  MercadoPagoSDK
//
//  Created by Eden Torres on 23/07/2018.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import Foundation

extension OneTapFlow {
    func startPaymentFlow() {
        guard let paymentFlow = model.paymentFlow else {
            return
        }
        paymentFlow.paymentErrorHandler = self
        if model.needToShowLoading() {
            self.pxNavigationHandler.presentLoading()
        }
        paymentFlow.setData(paymentData: model.paymentData, checkoutPreference: model.checkoutPreference, resultHandler: self)
        paymentFlow.start()
    }
}

extension OneTapFlow: PXPaymentResultHandlerProtocol {
    func finishPaymentFlow(error: MPSDKError) {
        guard let reviewScreen = pxNavigationHandler.navigationController.viewControllers.last as? PXOneTapViewController else {
            return
        }
        reviewScreen.resetButton()
    }

    func finishPaymentFlow(paymentResult: PaymentResult, instructionsInfo: PXInstructions?) {
        self.model.paymentResult = paymentResult
        self.model.instructionsInfo = instructionsInfo
        if self.model.needToShowLoading() {
            self.executeNextStep()
        } else {
            PXAnimatedButton.animateButtonWith(status: paymentResult.status, statusDetail: paymentResult.statusDetail)
        }
    }

    func finishPaymentFlow(businessResult: PXBusinessResult) {
        self.model.businessResult = businessResult
        if self.model.needToShowLoading() {
            self.executeNextStep()
        } else {
            PXAnimatedButton.animateButtonWith(status: businessResult.getStatus().getDescription())
        }
    }
}

extension OneTapFlow: PXPaymentErrorHandlerProtocol {
    func escError() {
        model.readyToPay = true
        model.mpESCManager.deleteESC(cardId: model.paymentData.getToken()?.cardId ?? "")
        model.paymentData.cleanToken()
        executeNextStep()
    }
}
