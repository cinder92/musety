//
//  FlowService.swift
//  MercadoPagoPXTracking
//
//  Created by Juan sebastian Sanzone on 9/3/18.
//  Copyright © 2018 Mercado Pago. All rights reserved.
//

import Foundation

final internal class FlowService {

    static let FLOW_ID_KEY: String = "flow_id"
    private var flowId: String

    init(_ currentFlowId: String = FlowService.getUUID()) {
        flowId = currentFlowId
    }

    func getFlowId() -> String {
        return flowId
    }

    func startNewFlow() {
        flowId = FlowService.getUUID()
    }

    func startNewFlow(externalFlowId: String) {
        flowId = externalFlowId
    }
}

// MARK: - Internal functions.
internal extension FlowService {
    static internal func getUUID() -> String {
        return UUID().uuidString.lowercased()
    }
}
