//
//  Unit.swift
//  ConversionCalculator
//
//  Created by Jordan Gunter on 7/26/17.
//  Copyright © 2017 Jordan Gunter. All rights reserved.
//

import Foundation

struct Unit {
    //let units = ["Fahrenheit", "Celsius", "Miles", "Kilometers"]
    var name: String
    var value: Double?
    
    init(name: String, strValue: String) {
        self.value = Double(strValue)
        self.name = name
    }
    
    func convert() -> Double{
        if let value = value{
            switch name {
            case "Fahrenheit":
                return (value - 32) * 5/9
            case "Celsius":
                return (value * 9/5) + 32
            case "Miles":
                return value * 1.609344
            case "Kilometers":
                return value * 0.62137119
            case "Yards":
                return value * 0.9144
            case "Meters":
                return value * 1.0936133
            default:
                return 0
            }
        }
        else{
            return 0
        }
    }
}
