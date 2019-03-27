//
//  Date+Additions.swift
//  MercadoPagoPXTracking
//
//  Created by Eden Torres on 3/12/18.
//  Copyright © 2018 Mercado Pago. All rights reserved.
//

import Foundation
internal extension Date {
    internal func getCurrentMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }

    internal func from(millis: Int64) -> Date {
        let timeInterval: TimeInterval = Double(millis) / 1000
        return Date(timeIntervalSince1970: timeInterval)
    }
}
