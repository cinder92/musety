//
//  InitFlow.swift
//  MercadoPagoSDK
//
//  Created by Juan sebastian Sanzone on 26/6/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import Foundation

final class InitFlow: PXFlow {
    var pxNavigationHandler: PXNavigationHandler
    let model: InitFlowModel

    private var status: PXFlowStatus = .ready
    private let finishInitCallback: ((PXCheckoutPreference, PXPaymentMethodSearch, [PXCampaign]?, PXDiscount?) -> Void)
    private let errorInitCallback: ((InitFlowError) -> Void)

    init(flowProperties: InitFlowProperties, finishCallback: @escaping ((PXCheckoutPreference, PXPaymentMethodSearch, [PXCampaign]?, PXDiscount?) -> Void), errorCallback: @escaping ((InitFlowError) -> Void)) {
        pxNavigationHandler = PXNavigationHandler.getDefault()
        finishInitCallback = finishCallback
        errorInitCallback = errorCallback
        model = InitFlowModel(flowProperties: flowProperties)
    }

    func updateModel(paymentPlugin: PXPaymentProcessor?, paymentMethodPlugins: [PXPaymentMethodPlugin]?) {
        var pmPlugins: [PXPaymentMethodPlugin] = [PXPaymentMethodPlugin]()
        if let targetPlugins = paymentMethodPlugins {
            pmPlugins = targetPlugins
        }
        model.update(paymentPlugin: paymentPlugin, paymentMethodPlugins: pmPlugins)
    }

    deinit {
        #if DEBUG
            print("DEINIT FLOW - \(self)")
        #endif
    }

    func start() {
        if status != .running {
            status = .running
            executeNextStep()
        }
    }

    func executeNextStep() {
        let nextStep = model.nextStep()
        switch nextStep {
        case .SERVICE_GET_PREFERENCE:
            getCheckoutPreference()
        case .ACTION_VALIDATE_PREFERENCE:
            validatePreference()
        case .SERVICE_GET_CAMPAIGNS:
            getCampaigns()
        case .SERVICE_GET_DIRECT_DISCOUNT:
            getDirectDiscount()
        case .SERVICE_GET_PAYMENT_METHODS:
            getPaymentMethodSearch()
        case .SERVICE_PAYMENT_METHOD_PLUGIN_INIT:
            initPaymentMethodPlugins()
        case .FINISH:
            finishFlow()
        case .ERROR:
            cancelFlow()
        }
    }

    func finishFlow() {
        status = .finished
        if let paymentMethodsSearch = model.getPaymentMethodSearch() {
            finishInitCallback(model.properties.checkoutPreference, paymentMethodsSearch, model.properties.campaigns, model.properties.discount)
        } else {
            cancelFlow()
        }
    }

    func cancelFlow() {
        status = .finished
        errorInitCallback(model.getError())
        model.resetError()
    }

    func exitCheckout() {}
}

// MARK: - Getters
extension InitFlow {
    func setFlowRetry(step: InitFlowModel.Steps) {
        status = .ready
        model.setPendingRetry(forStep: step)
    }

    func disposePendingRetry() {
        model.removePendingRetry()
    }

    func getStatus() -> PXFlowStatus {
        return status
    }

    func restart() {
        if status != .running {
            status = .ready
        }
    }
}
