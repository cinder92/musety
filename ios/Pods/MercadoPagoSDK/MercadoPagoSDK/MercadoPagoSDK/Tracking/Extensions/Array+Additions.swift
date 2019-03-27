//
//  Array+Additions.swift
//  MercadoPagoPXTracking
//
//  Created by Eden Torres on 10/30/17.
//  Copyright © 2017 Mercado Pago. All rights reserved.
//

import Foundation
internal extension Array {
    internal mutating func safeRemoveLast(_ suffix: Int) {
        if suffix > self.count {
            self.removeAll()
        } else {
            self.removeLast(suffix)
        }
    }

    internal mutating func safeRemoveFirst(_ suffix: Int) {
        if suffix > self.count {
            self.removeAll()
        } else {
            self.removeFirst(suffix)
        }
    }

    static internal func isNullOrEmpty(_ value: Array?) -> Bool {
        return value == nil || value?.count == 0
    }
}
