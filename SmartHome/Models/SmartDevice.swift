//
//  SmartDevice.swift
//  SmartHome
//
//  Created by Rylie Castell on 20.05.25.
//

import Foundation

struct SmartDevice: Identifiable {
    var id: UUID = UUID()
    var name: String
    var type: DeviceType
    
    var isOn: Bool
    var temperature: Double
    var isLocked: Bool
    
    init(name: String, type: DeviceType, isOn: Bool = false, temperature: Double = 20, isLocked: Bool = true) {
        self.name = name
        self.type = type
        self.isOn = isOn
        self.temperature = temperature
        self.isLocked = isLocked
    }
}
