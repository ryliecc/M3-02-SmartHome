//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Rylie Castell on 19.05.25.
//

import SwiftUI

struct SmartHomeView: View {
    @State var roomViewIsVisible: Bool = true
    @State var smartDevices: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", type: .light),
        SmartDevice(name: "Lichterkette", type: .light, isOn: true),
        SmartDevice(name: "Wandlampe", type: .light, isOn: true),
        SmartDevice(name: "Heizung", type: .thermostat),
        SmartDevice(name: "Haustür", type: .lock),
        SmartDevice(name: "Tresor", type: .lock, isLocked: false),
    ]
    @State var newDevice: SmartDevice = SmartDevice(name: "", type: .light)

    @State var selectedDeviceType: DeviceType = .light

    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            HStack {
                TextField("Neues Gerät", text: $newDevice.name)
                Picker("Gerätetyp wählen", selection: $selectedDeviceType) {
                    ForEach(DeviceType.allCases, id: \.id) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.menu)
                Button("Hinzufügen") {
                    if newDevice.name.count >= 1 {
                        newDevice = SmartDevice(
                            name: newDevice.name,
                            type: selectedDeviceType
                        )
                        smartDevices.append(newDevice)
                        newDevice.name = ""
                    }
                }
            }
            .padding()
            SmartDeviceView(smartDevices: $smartDevices)
            RoomView(
                roomViewIsVisible: $roomViewIsVisible,
                smartDevices: $smartDevices
            )
        }
    }
}

#Preview {
    SmartHomeView()
}
