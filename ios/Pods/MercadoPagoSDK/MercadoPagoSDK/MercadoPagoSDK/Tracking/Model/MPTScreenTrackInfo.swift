//
//  ScreenTrackInfo.swift
//  MercadoPagoPXTracking
//
//  Created by Eden Torres on 3/12/18.
//  Copyright © 2018 Mercado Pago. All rights reserved.
//

import Foundation

internal class MPTScreenTrackInfo: MPTrackInfo {

    var screenName: String
    var screenId: String
    var timestamp: Int64
    var type: String
    var properties: [String: String]
    init(screenName: String, screenId: String, properties: [String: String]) {
        self.screenName = screenName
        self.screenId = screenId
        self.properties = properties
        for key in properties.keys {
            if properties[key] == nil {
                self.properties.removeValue(forKey: key)
            }
        }

        self.timestamp = Date().getCurrentMillis()
        self.type = MPTTrackType.SCREENVIEW.rawValue
    }
    func toJSON() -> [String: Any] {
        let obj: [String: Any] = [
            "timestamp": self.timestamp,
            "type": self.type,
            "screen_id": self.screenId,
            "screen_name": self.screenName,
            "properties": self.properties
        ]
        return obj
    }
    init(from json: [String: Any]) {

        self.screenName = json["screen_name"] as! String
        self.screenId = json["screen_id"] as! String
        self.timestamp = json["timestamp"] as! Int64
        self.type = json["type"] as! String
        self.properties = json["properties"] as? [String: String] ?? [:]
    }

    func toJSONString() -> String {
        return TrackingJSONHandler.jsonCoding(self.toJSON())
    }
}
