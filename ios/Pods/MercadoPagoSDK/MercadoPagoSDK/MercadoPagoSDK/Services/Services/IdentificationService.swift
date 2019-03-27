//
//  IdentificationService.swift
//  MercadoPagoSDK
//
//  Created by Matias Gualino on 5/2/15.
//  Copyright (c) 2015 com.mercadopago. All rights reserved.
//

import Foundation
internal class IdentificationService: MercadoPagoService {
    let merchantPublicKey: String!
    let payerAccessToken: String?

    init (baseURL: String, merchantPublicKey: String, payerAccessToken: String? = nil) {
        self.merchantPublicKey = merchantPublicKey
        self.payerAccessToken = payerAccessToken
        super.init(baseURL: baseURL)
    }
    internal func getIdentificationTypes(uri: String = PXServicesURLConfigs.MP_IDENTIFICATION_URI, success: @escaping (_ data: Data?) -> Void, failure: ((_ error: PXError) -> Void)?) {

        let params: String = MercadoPagoServices.getParamsPublicKeyAndAcessToken(merchantPublicKey, payerAccessToken)

        self.request(uri: uri, params: params, body: nil, method: HTTPMethod.get, success: success, failure: { (error) -> Void in
            if let failure = failure {
                failure(PXError(domain: "mercadopago.sdk.IdentificationService.getIdentificationTypes", code: ErrorTypes.NO_INTERNET_ERROR, userInfo: [NSLocalizedDescriptionKey: "Hubo un error", NSLocalizedFailureReasonErrorKey: "Verifique su conexión a internet e intente nuevamente"]))
            }
        })
    }
}
