//
//  PXCurrencies.swift
//  MercadoPagoSDK
//
//  Created by Eden Torres on 10/23/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation
/// :nodoc:
open class PXCurrencies: NSObject {

    static let CURRENCY_ARGENTINA = "ARS"
    static let CURRENCY_BRAZIL = "BRL"
    static let CURRENCY_CHILE = "CLP"
    static let CURRENCY_COLOMBIA = "COP"
    static let CURRENCY_MEXICO = "MXN"
    static let CURRENCY_VENEZUELA = "VEF"
    static let CURRENCY_USA = "USD"
    static let CURRENCY_PERU = "PEN"
    static let CURRENCY_URUGUAY = "UYU"

    open class var currenciesList: [String: PXCurrency] { return [
        "ARS": PXCurrency(id: "ARS", description: "Peso argentino", symbol: "$", decimalPlaces: 2, decimalSeparator: ",", thousandSeparator: "."),
        "BRL": PXCurrency(id: "BRL", description: "Real", symbol: "R$", decimalPlaces: 2, decimalSeparator: ",", thousandSeparator: "."),
        "CLP": PXCurrency(id: "CLP", description: "Peso chileno", symbol: "$", decimalPlaces: 0, decimalSeparator: "", thousandSeparator: "."),
        "MXN": PXCurrency(id: "MXN", description: "Peso mexicano", symbol: "$", decimalPlaces: 2, decimalSeparator: ".", thousandSeparator: ","),
        "PEN": PXCurrency(id: "PEN", description: "Soles", symbol: "S/.", decimalPlaces: 2, decimalSeparator: ",", thousandSeparator: "."),
        "UYU": PXCurrency(id: "UYU", description: "Peso Uruguayo", symbol: "$", decimalPlaces: 2, decimalSeparator: ",", thousandSeparator: "."),
        "COP": PXCurrency(id: "COP", description: "Peso colombiano", symbol: "$", decimalPlaces: 0, decimalSeparator: "", thousandSeparator: "."),
        "VEF": PXCurrency(id: "VEF", description: "Bolivar fuerte", symbol: "BsF", decimalPlaces: 2, decimalSeparator: ",", thousandSeparator: ".")
        ]}
}
