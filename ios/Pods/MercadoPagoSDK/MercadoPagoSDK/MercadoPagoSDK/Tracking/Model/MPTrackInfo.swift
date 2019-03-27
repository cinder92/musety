//
//  MPTrackInfo.swift
//  MercadoPagoPXTracking
//
//  Created by Eden Torres on 3/12/18.
//  Copyright © 2018 Mercado Pago. All rights reserved.
//

import Foundation
internal protocol MPTrackInfo {
    func toJSON() -> [String: Any]
}
