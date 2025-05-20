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
}
