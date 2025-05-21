//
//  Enums.swift
//  SmartHome
//
//  Created by Rylie Castell on 20.05.25.
//

import Foundation

enum DeviceType: String, CaseIterable, Identifiable {
    case light = "Licht"
    case thermostat = "Thermostat"
    case lock = "Schloss"
    
    var id: String {self.rawValue}
    
    var sfSymbolName: String {
        switch self {
        case .light: "lightbulb"
        case .lock: "lock.fill"
        case .thermostat: "thermometer.transmission"
        }
    }
}
