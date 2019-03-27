//
//  MercadoPagoCheckout+PaymentFlowHandler.swift
//  MercadoPagoSDK
//
//  Created by Eden Torres on 03/07/2018.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import Foundation

extension MercadoPagoCheckout: PXPaymentResultHandlerProtocol {
    func finishPaymentFlow(error: MPSDKError) {
        guard let reviewScreen = viewModel.pxNavigationHandler.navigationController.viewControllers.last as? PXReviewViewController else {
            return
        }

        reviewScreen.resetButton()
    }

    func finishPaymentFlow(paymentResult: PaymentResult, instructionsInfo: PXInstructions?) {
        viewModel.paymentResult = paymentResult
        viewModel.instructionsInfo = instructionsInfo

        if viewModel.pxNavigationHandler.navigationController.viewControllers.last as? PXReviewViewController != nil {
            PXAnimatedButton.animateButtonWith(status: paymentResult.status, statusDetail: paymentResult.statusDetail)
        } else {
            executeNextStep()
        }

    }

    func finishPaymentFlow(businessResult: PXBusinessResult) {
        self.viewModel.businessResult = businessResult
            if self.viewModel.pxNavigationHandler.navigationController.viewControllers.last as? PXReviewViewController != nil {
                PXAnimatedButton.animateButtonWith(status: businessResult.getStatus().getDescription())
            } else {
                self.executeNextStep()
            }
    }
}
