//
//  SmartDeviceView.swift
//  SmartHome
//
//  Created by Rylie Castell on 20.05.25.
//

import SwiftUI

struct SmartDeviceView: View {
    @Binding var smartDevices: [SmartDevice]
    @State var listView: String = "List"

    var body: some View {
        ScrollView {
            Picker("", selection: $listView) {
                Text("List").tag("List")
                Text("Grid").tag("Grid")
            }
            .pickerStyle(.segmented)
            if listView == "List" {
                ListDeviceView(smartDevices: $smartDevices)
            } else {
                GridDeviceView(smartDevices: $smartDevices)
            }
        }
    }
}

#Preview {
    @Previewable @State var smartDevices: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", type: .light),
        SmartDevice(name: "Heizung", type: .thermostat),
        SmartDevice(name: "Haustür", type: .lock),
    ]
    SmartDeviceView(smartDevices: $smartDevices)
}
