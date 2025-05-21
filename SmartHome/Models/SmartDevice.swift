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
    var info: DeviceInfo
    
    init(name: String, type: DeviceType) {
        var info: DeviceInfo {
            switch type {
            case .light: .light(isOn: false)
            case .thermostat: .thermostat(isOn: false, temperature: 20)
            case .lock: .lock(isLocked: true)
            }
        }
        self.name = name
        self.type = type
        self.info = info
    }
}
