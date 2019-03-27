//
//  PaymentService.swift
//  MercadoPagoSDK
//
//  Created by Matias Gualino on 30/12/14.
//  Copyright (c) 2014 com.mercadopago. All rights reserved.
//

import Foundation

internal class PaymentService: MercadoPagoService {

    let merchantPublicKey: String!
    let payerAccessToken: String?
    let processingMode: String!

    init (baseURL: String, merchantPublicKey: String, payerAccessToken: String? = nil, processingMode: String) {
        self.merchantPublicKey = merchantPublicKey
        self.payerAccessToken = payerAccessToken
        self.processingMode = processingMode
        super.init(baseURL: baseURL)
    }

    internal func getPaymentMethods(uri: String = PXServicesURLConfigs.MP_PAYMENT_METHODS_URI, success: @escaping (_ data: Data) -> Void, failure: ((_ error: PXError) -> Void)?) {

        var params: String = MercadoPagoServices.getParamsPublicKeyAndAcessToken(merchantPublicKey, payerAccessToken)
        params.paramsAppend(key: ApiParams.PROCESSING_MODE, value: processingMode)

        self.request(uri: uri, params: params, body: nil, method: HTTPMethod.get, success: success, failure: { (error) in
            if let failure = failure {
                failure(PXError(domain: "mercadopago.sdk.paymentService.getPaymentMethods", code: error.code, userInfo: [NSLocalizedDescriptionKey: "Hubo un error", NSLocalizedFailureReasonErrorKey: "Verifique su conexión a internet e intente nuevamente"]))
            }
        })
    }

    open func getInstallments(uri: String = PXServicesURLConfigs.MP_INSTALLMENTS_URI, bin: String?, amount: Double, issuerId: String?, payment_method_id: String, differential_pricing_id: String?, success: @escaping ([PXInstallment]) -> Void, failure: @escaping ((_ error: PXError) -> Void)) {

        var params: String = MercadoPagoServices.getParamsPublicKeyAndAcessToken(merchantPublicKey, payerAccessToken)
        params.paramsAppend(key: ApiParams.BIN, value: bin)
        params.paramsAppend(key: ApiParams.AMOUNT, value: String(format: "%.2f", amount))
        params.paramsAppend(key: ApiParams.ISSUER_ID, value: String(describing: issuerId!))
        params.paramsAppend(key: ApiParams.PAYMENT_METHOD_ID, value: payment_method_id)
        params.paramsAppend(key: ApiParams.PROCESSING_MODE, value: processingMode)
        params.paramsAppend(key: ApiParams.DIFFERENTIAL_PRICING_ID, value: differential_pricing_id)

        self.request( uri: uri, params: params, body: nil, method: HTTPMethod.get, success: {(data: Data) -> Void in
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)

                if let errorDic = jsonResult as? NSDictionary {
                    if errorDic["error"] != nil {
                        let apiException = try PXApiException.fromJSON(data: data)
                        failure(PXError(domain: "mercadopago.sdk.paymentService.getInstallments", code: ErrorTypes.API_EXCEPTION_ERROR, userInfo: [NSLocalizedDescriptionKey: "Hubo un error", NSLocalizedFailureReasonErrorKey: errorDic["error"] as? String ?? "Unknowed Error"], apiException: apiException))

                    }
                } else {
                    var installments : [PXInstallment] = [PXInstallment]()
                    installments =  try PXInstallment.fromJSON(data: data)
                    success(installments)
                }
            } catch {
                failure(PXError(domain: "mercadopago.sdk.paymentService.getInstallments", code: ErrorTypes.API_EXCEPTION_ERROR, userInfo: [NSLocalizedDescriptionKey: "Hubo un error", NSLocalizedFailureReasonErrorKey: "No se ha podido obtener las cuotas"]))
            }
        }, failure: { (error) in
            failure(PXError(domain: "mercadopago.sdk.paymentService.getInstallments", code: error.code, userInfo: [NSLocalizedDescriptionKey: "Hubo un error", NSLocalizedFailureReasonErrorKey: "Verifique su conexión a internet e intente nuevamente"]))

        })
    }

    open func getIssuers(uri: String = PXServicesURLConfigs.MP_ISSUERS_URI, payment_method_id: String, bin: String? = nil, success:  @escaping (_ data: Data) -> Void, failure: ((_ error: PXError) -> Void)?) {

        var params: String = MercadoPagoServices.getParamsPublicKeyAndAcessToken(merchantPublicKey, payerAccessToken)
        params.paramsAppend(key: ApiParams.PAYMENT_METHOD_ID, value: payment_method_id)
        params.paramsAppend(key: ApiParams.BIN, value: bin)
        params.paramsAppend(key: ApiParams.PROCESSING_MODE, value: processingMode)

        if bin != nil {
            self.request(uri: uri, params: params, body: nil, method: HTTPMethod.get, success: success, failure: { (error) in
                if let failure = failure {
                    failure(PXError(domain: "mercadopago.sdk.paymentService.getIssuers", code: error.code, userInfo: [NSLocalizedDescriptionKey: "Hubo un error", NSLocalizedFailureReasonErrorKey: "Verifique su conexión a internet e intente nuevamente"]))
                }
            })
        } else {
            self.request(uri: uri, params: params, body: nil, method: HTTPMethod.get, success: success, failure: { (error) in
                if let failure = failure {
                    failure(PXError(domain: "mercadopago.sdk.paymentService.getIssuers", code: error.code, userInfo: [NSLocalizedDescriptionKey: "Hubo un error", NSLocalizedFailureReasonErrorKey: "Verifique su conexión a internet e intente nuevamente"]))
                }
            })
        }
    }

}
