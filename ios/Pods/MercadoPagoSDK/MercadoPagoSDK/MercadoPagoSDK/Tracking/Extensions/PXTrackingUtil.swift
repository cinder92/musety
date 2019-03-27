//
//  PXTrackingUtil.swift
//  MercadoPagoSDK
//
//  Created by Eden Torres on 10/05/2018.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import Foundation

// MARK: - Metadata/Params
internal extension TrackingUtil {
    struct Metadata {
        static let INSTALLMENTS = "installments"
        static let HAS_DISCOUNT = "has_discount"
    }
}

// MARK: - Screens
internal extension TrackingUtil {
    enum ScreenId {
        static let REVIEW_AND_CONFIRM_ONE_TAP = "/express"
        static let DISCOUNT_TERM_CONDITION = "/discount_terms_conditions"
    }
}

// MARK: - Events
internal extension TrackingUtil {
    struct Event {
        static let TAP_SUMMARY_DETAIL = "/open_summary_detail"
        static let TAP_BACK = "/back_action"
    }
}
