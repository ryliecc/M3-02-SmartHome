//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Rylie Castell on 19.05.25.
//

import SwiftUI

struct SmartHomeView: View {
    @State var roomViewIsVisible: Bool = false
    @State var smartDevices: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", type: .light()),
        SmartDevice(name: "Heizung", type: .thermostat()),
        SmartDevice(name: "Haustür", type: .lock()),
    ]
    @State var newLight: SmartDevice = SmartDevice(name: "", type: .light())

    var body: some View {
        VStack {
            HeaderView()
            HStack {
                TextField("Neues Licht", text: $newLight.name)
                Button("Hinzufügen") {
                    if newLight.name.count >= 1 {
                        smartDevices.append(newLight)
                        newLight = SmartDevice(name: "", type: .light())
                    }
                }
            }
            .padding()
            SmartDeviceView(smartDevices: $smartDevices)
            RoomView(roomViewIsVisible: $roomViewIsVisible)
        }
    }
}

#Preview {
    SmartHomeView()
}
