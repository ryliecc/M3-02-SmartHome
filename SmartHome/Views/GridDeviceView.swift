//
//  GridDeviceView.swift
//  SmartHome
//
//  Created by Rylie Castell on 22.05.25.
//

import SwiftUI

struct GridDeviceView: View {
    @Binding var smartDevices: [SmartDevice]
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach($smartDevices, id: \.id) { smartDevice in
                    if smartDevice.wrappedValue.type == .light {
                        VStack(alignment: .center, spacing: 10) {
                            Text(smartDevice.wrappedValue.name)
                                .lineLimit(1)
                                .font(Fonts.deviceTypeName)
                                .foregroundColor(smartDevice.wrappedValue.isOn ? .white : .black)
                                .padding(.leading)
                                .padding(.trailing)
                            Image(
                                systemName: smartDevice.wrappedValue.isOn
                                ? "lightbulb.fill" : "lightbulb"
                            )
                            .foregroundColor(smartDevice.wrappedValue.isOn ? .white : .black)
                            .padding()
                        }
                        .frame(width: 108, height: 108)
                        .background(
                            RoundedRectangle(cornerRadius: 9).fill(smartDevice.wrappedValue.isOn ?
                                Color(
                                    red: 54 / 255,
                                    green: 54 / 255,
                                    blue: 53 / 255
                                ) : Color(
                                    red: 217 / 255,
                                    green: 217 / 255,
                                    blue: 217 / 255
                                )
                            )
                        )
                    } else if smartDevice.wrappedValue.type == .thermostat {
                        VStack(alignment: .center, spacing: 10) {
                            Text(smartDevice.wrappedValue.name)
                                .lineLimit(1)
                                .font(Fonts.deviceTypeName)
                                .foregroundColor(.black)
                                .padding(.leading)
                                .padding(.trailing)
                            Text(
                                "\(String(format: "%.0f", smartDevice.wrappedValue.temperature))°C"
                            )
                            Stepper(
                                "",
                                value: smartDevice.temperature,
                                step: 1
                            )
                            .labelsHidden()
                        }
                        .frame(width: 108, height: 108)
                        .background(
                            RoundedRectangle(cornerRadius: 9).fill(Color(
                                    red: 217 / 255,
                                    green: 217 / 255,
                                    blue: 217 / 255
                                )
                            )
                        )
                    } else {
                        VStack(alignment: .center, spacing: 10) {
                            Text(smartDevice.wrappedValue.name)
                                .lineLimit(1)
                                .font(Fonts.deviceTypeName)
                                .foregroundColor(smartDevice.wrappedValue.isLocked ? .white : .black)
                                .padding(.leading)
                                .padding(.trailing)
                            Image(systemName: smartDevice.wrappedValue.isLocked ? "lock.fill" : "lock.open.fill")
                                .foregroundColor(smartDevice.wrappedValue.isLocked ? .white : .black)
                                .padding()
                        }
                        .frame(width: 108, height: 108)
                        .background(
                            RoundedRectangle(cornerRadius: 9).fill(smartDevice.wrappedValue.isLocked ?
                                Color(
                                    red: 54 / 255,
                                    green: 54 / 255,
                                    blue: 53 / 255
                                ) : Color(
                                    red: 217 / 255,
                                    green: 217 / 255,
                                    blue: 217 / 255
                                )
                            )
                        )
                    }
            }
        }
    }
}

#Preview {
    @Previewable @State var smartDevices: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", type: .light),
        SmartDevice(name: "Lichterkette", type: .light, isOn: true),
        SmartDevice(name: "Wandlampe", type: .light, isOn: true),
        SmartDevice(name: "Heizung", type: .thermostat),
        SmartDevice(name: "Haustür", type: .lock),
        SmartDevice(name: "Tresor", type: .lock, isLocked: false),
    ]
    GridDeviceView(smartDevices: $smartDevices)
}
