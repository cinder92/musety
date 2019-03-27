//
//  CurrenciesUtil.swift
//  MercadoPagoSDK
//
//  Created by Matias Gualino on 3/3/15.
//  Copyright (c) 2015 com.mercadopago. All rights reserved.
//

import Foundation

private func < <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l__?, r__?):
    return l__ < r__
  case (nil, _?):
    return true
  default:
    return false
  }
}

private func > <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l__?, r__?):
    return l__ > r__
  default:
    return rhs < lhs
  }
}

@objcMembers
internal class CurrenciesUtil {

    internal class var currenciesList: [String: PXCurrency] { return [
        //Argentina
        "ARS": PXCurrency(id: "ARS", description: "Peso argentino", symbol: "$", decimalPlaces: 2, decimalSeparator: ",", thousandSeparator: "."),
        //Brasil
        "BRL": PXCurrency(id: "BRL", description: "Real", symbol: "R$", decimalPlaces: 2, decimalSeparator: ",", thousandSeparator: "."),
        //Chile
        "CLP": PXCurrency(id: "CLP", description: "Peso chileno", symbol: "$", decimalPlaces: 0, decimalSeparator: "", thousandSeparator: "."),

        //Mexico
        "MXN": PXCurrency(id: "MXN", description: "Peso mexicano", symbol: "$", decimalPlaces: 2, decimalSeparator: ".", thousandSeparator: ","),
		//Peru
        "PEN": PXCurrency(id: "PEN", description: "Soles", symbol: "S/.", decimalPlaces: 2, decimalSeparator: ",", thousandSeparator: "."),
		//Uruguay
        "UYU": PXCurrency(id: "UYU", description: "Peso Uruguayo", symbol: "$", decimalPlaces: 2, decimalSeparator: ",", thousandSeparator: "."),
		//Colombia

        "COP": PXCurrency(id: "COP", description: "Peso colombiano", symbol: "$", decimalPlaces: 0, decimalSeparator: "", thousandSeparator: "."),

		//Venezuela
        "VES": PXCurrency(id: "VES", description: "Bolívares Soberanos", symbol: "BsS", decimalPlaces: 2, decimalSeparator: ",", thousandSeparator: ".")

        ]}

    internal class func getCurrencyFor(_ currencyId: String?) -> PXCurrency? {
        return (currencyId != nil && currencyId?.count > 0) ? self.currenciesList[currencyId!] : nil
    }
}
