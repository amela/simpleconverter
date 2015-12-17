//
//  ConverterBrain.swift
//  SimpleConverter
//
//  Created by amela on 19/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

import Foundation

// MARK: - Def. Model Operators

func ==(lhs: Currency, rhs:Currency) -> Bool {
    return lhs.currency == rhs.currency && lhs.exchangeRate == rhs.exchangeRate
}

func <(lhs: Currency, rhs:Currency) -> Bool {
    return lhs.exchangeRate < rhs.exchangeRate
}

// MARK: - Converter Model

class Currency: Equatable, Comparable {
    var currency: String
    var exchangeRate: Double
    
    init(currency: String, exchangeRate: Double) {
        self.currency = currency
        self.exchangeRate = exchangeRate
    }
}

class ConverterBrain {
    
    static let sharedConverter = ConverterBrain()
    private init() {}
    
    func convert(value: Double, targetCurrency: Currency) -> (convertedValue: Double,
        targetCurrency: String)? {
            
        let eur2x = targetCurrency.exchangeRate
        
        return(value * eur2x, "Exchange Rate: EUR2" + targetCurrency.currency + " \(eur2x)")
        
    }
}

extension Double {
    func convertDouble(valute: Currency) -> (Double, String)? {
        if let x = ConverterBrain.sharedConverter.convert(self, targetCurrency: valute) {
            return x
        }
        return nil
    }
}

