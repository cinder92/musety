//
//  MPTDevice.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 6/1/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import UIKit

internal class MPTDevice: NSObject {
    let model: String
    let os: String
    let systemVersion: String
    let screenSize: String
    let resolution: String
    var uuid: String

    override init() {
        self.model = UIDevice.current.model
        self.os =  "iOS"
        self.systemVersion = UIDevice.current.systemVersion
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.screenSize = String(describing: screenWidth) + "x" + String(describing: screenHeight)
        self.resolution = String(describing: UIScreen.main.scale)
        self.uuid = ""
    }

    func toJSON() -> [String: Any] {

        if let targetUuid = UIDevice.current.identifierForVendor?.uuidString {
            self.uuid = targetUuid
        }

        let obj: [String: Any] = [
            "model": model,
            "os": os,
            "system_version": systemVersion,
            "screen_size": screenSize,
            "resolution": resolution,
            "uuid": uuid
        ]
        return obj
    }
    func toJSONString() -> String {
        return TrackingJSONHandler.jsonCoding(self.toJSON())
    }
}
