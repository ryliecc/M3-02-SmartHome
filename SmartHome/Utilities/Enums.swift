//
//  Enums.swift
//  SmartHome
//
//  Created by Rylie Castell on 20.05.25.
//

import Foundation

enum DeviceType {
    case light(isOn: Bool = false)
    case thermostat(isOn: Bool = false, temperature: Double = 20)
    case lock(isLocked: Bool = true)
    
    var sfSymbolName: String {
        switch self {
        case .light: "lightbulb"
        case .lock: "lock.fill"
        case .thermostat: "thermometer.transmission"
        }
    }
    
    var typeName: String {
        switch self {
        case .light: "Licht"
        case .lock: "Schloss"
        case .thermostat: "Thermostat"
        }
    }
}
