//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Rylie Castell on 19.05.25.
//

import SwiftUI

struct SmartHomeView: View {
    @State var inputs: [String] = []
    @State var textInput: String = ""
    @State var roomViewIsVisible: Bool = false

    @State var smartDevices: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", type: .light()),
        SmartDevice(name: "Heizung", type: .thermostat()),
        SmartDevice(name: "Haustür", type: .lock()),
    ]

    var body: some View {
        HStack {
            TextField("Gib einen Namen ein...", text: $textInput)
            Button("Hinzufügen") {
                if textInput.count >= 1 {
                    inputs.append(textInput)
                    textInput = ""
                }
            }
        }
        .padding()
        ScrollView {
            VStack {
                ForEach(inputs, id: \.self) { input in
                    Text(input)
                }
            }
        }
        ScrollView {
            SmartDeviceView(smartDevices: $smartDevices)
        }
        VStack {
            RoomView(roomViewIsVisible: $roomViewIsVisible)
            Toggle(
                "Raumvorschau "
                    + (roomViewIsVisible ? "schließen" : "anzeigen"),
                isOn: $roomViewIsVisible
            )
            .padding()
        }
    }
}

#Preview {
    SmartHomeView()
}
