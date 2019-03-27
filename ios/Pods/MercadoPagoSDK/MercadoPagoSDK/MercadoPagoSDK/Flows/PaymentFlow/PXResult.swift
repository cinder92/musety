//
//  PXResult.swift
//  MercadoPagoSDKV4
//
//  Created by Demian Tejo on 19/9/18.
//

@objc
public protocol PXResult {
    func getPaymentId() -> String?
    func getStatus() -> String
    func getStatusDetail() -> String
}
