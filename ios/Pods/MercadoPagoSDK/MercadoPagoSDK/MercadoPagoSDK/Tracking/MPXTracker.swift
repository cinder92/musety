//
//  MPXTracker.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 6/1/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import UIKit

internal struct MPXTrackingEnvironment {
    public static let production = "production"
    public static let staging = "staging"
}

@objc
internal class MPXTracker: NSObject {
    @objc open static let sharedInstance = MPXTracker()

    internal static let kTrackingSettings = "tracking_settings"
    internal var public_key: String = ""
    internal var sdkVersion = Utils.getSetting(identifier: "sdk_version") ?? ""

    private static let kTrackingEnabled = "tracking_enabled"
    private var trackListener: PXTrackerListener?
    private var trackingStrategy: TrackingStrategy = RealTimeStrategy()
    private var flowService: FlowService = FlowService()
    private lazy var currentEnvironment: String = MPXTrackingEnvironment.production
}

// MARK: Getters/setters.
internal extension MPXTracker {
    internal func setPublicKey(_ public_key: String) {
        self.public_key = public_key.trimSpaces()
    }

    internal func getPublicKey() -> String {
        return self.public_key
    }

    internal func setEnvironment(environment: String) {
        self.currentEnvironment = environment
    }

    internal func getSdkVersion() -> String {
        return sdkVersion
    }

    internal func getPlatformType() -> String {
        return "/mobile/ios"
    }

    internal func isEnabled() -> Bool {
        guard let trackiSettings: [String: Any] = TrackingUtils.getSetting(identifier: MPXTracker.kTrackingSettings) else {
            return false
        }
        guard let trackingEnabled = trackiSettings[MPXTracker.kTrackingEnabled] as? Bool else {
            return false
        }
        return trackingEnabled
    }

    internal func setTrack(listener: PXTrackerListener) {
        trackListener = listener
    }

    internal func startNewFlow() {
        flowService.startNewFlow()
    }

    internal func startNewFlow(externalFlowId: String) {
        flowService.startNewFlow(externalFlowId: externalFlowId)
    }

    internal func getFlowID() -> String {
        return flowService.getFlowId()
    }
}

// MARK: Public interfase.
internal extension MPXTracker {
    internal func trackScreen(screenId: String, screenName: String, properties: [String: String] = [:]) {
        if let trackListenerInterfase = trackListener {
            trackListenerInterfase.trackScreen(screenName: screenId, extraParams: properties)
        }
        if !isEnabled() {
            return
        }
        setTrackingStrategy(screenID: screenId)
        let screenTrack = MPTScreenTrackInfo(screenName: screenName, screenId: screenId, properties: properties)
        trackingStrategy.trackScreen(screenTrack: screenTrack)
    }

    internal func trackActionEvent(action: String, screenId: String, screenName: String, properties: [String: String] = [:]) {
        if !isEnabled() {
            return
        }
        let trackingStrategy = RealTimeStrategy() // TODO: Use other strategies
        let screenTrack = MPTActionEventInfo(action: action, screenName: screenName, screenId: screenId, properties: properties)
        self.trackingStrategy = trackingStrategy
        trackingStrategy.trackActionEvent(actionEvenTrack: screenTrack)
    }

    internal func setTrackingStrategy(screenID: String) {
        let forcedScreens: [String] = [TrackingUtil.SCREEN_ID_PAYMENT_RESULT,
                                       TrackingUtil.SCREEN_ID_PAYMENT_RESULT_APPROVED,
                                       TrackingUtil.SCREEN_ID_PAYMENT_RESULT_PENDING,
                                       TrackingUtil.SCREEN_ID_PAYMENT_RESULT_REJECTED,
                                       TrackingUtil.SCREEN_ID_PAYMENT_RESULT_INSTRUCTIONS,
                                       TrackingUtil.SCREEN_ID_ERROR]
        if forcedScreens.contains(screenID) {
            trackingStrategy = ForceTrackStrategy()
        } else {
            trackingStrategy = BatchStrategy()
        }
    }
}

// MARK: Internal interfase.
internal extension MPXTracker {
    internal func generateJSONDefault() -> [String: Any] {
        let deviceJSON = MPTDevice().toJSON()
        let applicationJSON = MPTApplication(checkoutVersion: MPXTracker.sharedInstance.getSdkVersion(), platform: MPXTracker.sharedInstance.getPlatformType(), flowId: flowService.getFlowId(), environment: currentEnvironment).toJSON()
        let obj: [String: Any] = [
            "application": applicationJSON,
            "device": deviceJSON
        ]
        return obj
    }

    // TODO: Remove it is not used
    internal func generateJSONScreen(screenId: String, screenName: String, metadata: [String: Any]) -> [String: Any] {
        var obj = generateJSONDefault()
        let screenJSON = self.screenJSON(screenId: screenId, screenName: screenName, metadata: metadata)
        obj["events"] = [screenJSON]
        return obj
    }

    internal func generateJSONEvent(screenId: String, screenName: String, action: String, category: String, label: String, value: String) -> [String: Any] {
        var obj = generateJSONDefault()
        let eventJSON = self.eventJSON(screenId: screenId, screenName: screenName, action: action, category: category, label: label, value: value)
        obj["events"] = [eventJSON]
        return obj
    }

    internal func eventJSON(screenId: String, screenName: String, action: String, category: String, label: String, value: String) -> [String: Any] {
        let timestamp = Date().getCurrentMillis()
        let obj: [String: Any] = [
            "timestamp": timestamp,
            "type": "action",
            "screen_id": screenId,
            "screen_name": screenName,
            "action": action,
            "category": category,
            "label": label,
            "value": value
        ]
        return obj
    }

    // Todo: Remove, it is not used
    internal func screenJSON(screenId: String, screenName: String, metadata: [String: Any]) -> [String: Any] {
        let timestamp = Date().getCurrentMillis()
        let obj: [String: Any] = [
            "timestamp": timestamp,
            "type": "screenview",
            "screen_id": screenId,
            "screen_name": screenName,
            "metadata": metadata
        ]
        return obj
    }
}
