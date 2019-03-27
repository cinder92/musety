//
//  PXTracker.swift
//  MercadoPagoSDK
//
//  Created by Juan sebastian Sanzone on 30/8/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import Foundation

/**
Use this object to call methods related to our PX tracker.
 */
@objcMembers
open class PXTracker: NSObject {
    // MARK: Static Setter.
    /**
     Set your own tracker listener protocol to be aware of PX-Checkout tracking events
     */
    open static func setListener(_ listener: PXTrackerListener) {
        MPXTracker.sharedInstance.setTrack(listener: listener)
    }
}
