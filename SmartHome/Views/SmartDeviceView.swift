//
//  SmartDeviceView.swift
//  SmartHome
//
//  Created by Rylie Castell on 20.05.25.
//

import SwiftUI

struct SmartDeviceView: View {
    @Binding var smartDevices: [SmartDevice]
    
    var body: some View {
        VStack {
            ForEach(smartDevices, id: \.id) { smartDevice in
                HStack {
                    Image(systemName: smartDevice.type.sfSymbolName)
                    Text(smartDevice.name)
                    Spacer()
                    Text(smartDevice.type.typeName)
                }
                .padding()
            }
        }
    }
}

#Preview {
    @Previewable @State var smartDevices: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", type: .light()),
        SmartDevice(name: "Heizung", type: .thermostat()),
        SmartDevice(name: "Haustür", type: .lock()),
    ]
    SmartDeviceView(smartDevices: $smartDevices)
}
