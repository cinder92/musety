//
//  TrackingUtil.swift
//  MercadoPagoSDK
//
//  Created by Eden Torres on 7/7/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation

internal class TrackingUtil: NSObject {

    //Screen IDs
    static let SCREEN_ID_CHECKOUT = "/init"
    static let SCREEN_ID_PAYMENT_VAULT = "/payment_option"
    static let SCREEN_ID_REVIEW_AND_CONFIRM = "/review"
    static let SCREEN_ID_PAYMENT_RESULT = "/congrats"
    static let SCREEN_ID_PAYMENT_RESULT_APPROVED = "/congrats/approved"
    static let SCREEN_ID_PAYMENT_RESULT_PENDING = "/congrats/pending"
    static let SCREEN_ID_PAYMENT_RESULT_REJECTED = "/congrats/rejected"
    static let SCREEN_ID_PAYMENT_RESULT_INSTRUCTIONS = "/congrats/instructions"
    static let SCREEN_ID_PAYMENT_RESULT_BUSINESS = "/congrats/business"
    static let SCREEN_ID_BANK_DEALS = "/bank_deals"
    static let SCREEN_ID_CARD_FORM = "/card"
    static let SCREEN_ID_ERROR = "/failure"
    static let SCREEN_ID_PAYMENT_TYPES = "/card/payment_types"

    //Screen Names
    static let SCREEN_NAME_CHECKOUT = "INIT_CHECKOUT"
    static let SCREEN_NAME_PAYMENT_VAULT = "PAYMENT_METHOD_SEARCH"
    static let SCREEN_NAME_REVIEW_AND_CONFIRM = "REVIEW_AND_CONFIRM"
    static let SCREEN_NAME_PAYMENT_RESULT = "RESULT"
    static let SCREEN_NAME_PAYMENT_RESULT_CALL_FOR_AUTH = "CALL_FOR_AUTHORIZE"
    static let SCREEN_NAME_PAYMENT_RESULT_INSTRUCTIONS = "INSTRUCTIONS"
    static let SCREEN_NAME_BANK_DEALS = "BANK_DEALS"
    static let SCREEN_NAME_CARD_FORM = "CARD_VAULT"
    static let SCREEN_NAME_CARD_FORM_NUMBER = "CARD_NUMBER"
    static let SCREEN_NAME_CARD_FORM_NAME = "CARD_HOLDER_NAME"
    static let SCREEN_NAME_CARD_FORM_EXPIRY = "CARD_EXPIRY_DATE"
    static let SCREEN_NAME_CARD_FORM_CVV = "CARD_SECURITY_CODE"
    static let SCREEN_NAME_CARD_FORM_IDENTIFICATION_NUMBER = "IDENTIFICATION_NUMBER"
    static let SCREEN_NAME_CARD_FORM_ISSUERS = "CARD_ISSUERS"
    static let SCREEN_NAME_CARD_FORM_INSTALLMENTS = "CARD_INSTALLMENTS"
    static let SCREEN_NAME_ERROR = "ERROR_VIEW"
    static let SCREEN_NAME_PAYMENT_TYPES = "CARD_PAYMENT_TYPES"
    static let SCREEN_NAME_SECURITY_CODE = "SECURITY_CODE_CARD"

    //Sufix
    static let CARD_NUMBER = "/number"
    static let CARD_HOLDER_NAME = "/name"
    static let CARD_EXPIRATION_DATE = "/expiration"
    static let CARD_SECURITY_CODE = "/cvv"
    static let CARD_IDENTIFICATION = "/identification"
    static let CARD_ISSUER = "/issuer"
    static let CARD_INSTALLMENTS = "/installments"
    static let CARD_SECURITY_CODE_VIEW = "/security_code"

    //Additional Info Keys
    static let METADATA_PAYMENT_METHOD_ID = "payment_method"
    static let METADATA_PAYMENT_TYPE_ID = "payment_type"
    static let METADATA_AMOUNT_ID = "purchase_amount"
    static let METADATA_ISSUER_ID = "issuer"
    static let METADATA_SHIPPING_INFO = "has_shipping"
    static let METADATA_PAYMENT_STATUS = "payment_status"
    static let METADATA_PAYMENT_ID = "payment_id"
    static let METADATA_PAYMENT_STATUS_DETAIL = "payment_status_detail"
    static let METADATA_PAYMENT_IS_EXPRESS = "is_express"
    static let METADATA_ERROR_STATUS = "error_status"
    static let METADATA_ERROR_CODE = "error_code"
    static let METADATA_ERROR_REQUEST = "error_request_origin"
    static let METATDATA_SECURITY_CODE_VIEW_REASON = "security_code_view_reason"
    static let METADATA_INSTALLMENTS = "installments"
    static let METADATA_CARD_ID = "card_id"
    static let METADATA_OPTIONS = "options"

    //Default values
    static let HAS_SHIPPING_DEFAULT_VALUE = "false"
    static let IS_EXPRESS_DEFAULT_VALUE = "false"
    static let NO_NAME_SCREEN = "NO NAME"
    static let NO_SCREEN_ID = "/"

    // MARK: Action events
    static let ACTION_CHECKOUT_CONFIRMED = "/checkout_confirmed"
}
