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
}
