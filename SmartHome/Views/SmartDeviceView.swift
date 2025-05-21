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
        ScrollView {
            VStack(spacing: 16) {
                ForEach($smartDevices, id: \.id) { smartDevice in
                    if smartDevice.wrappedValue.type == .light {
                        HStack {
                            Image(systemName: "lightbulb")
                                .font(.system(size: 32))
                            Spacer()
                            VStack {
                                Text(smartDevice.wrappedValue.name)
                                    .font(Fonts.deviceName)
                                Spacer()
                                Text(smartDevice.wrappedValue.type.rawValue)
                                    .font(Fonts.deviceTypeName)
                            }
                            .padding()
                            Spacer()
                            Toggle("", isOn: smartDevice.isOn)
                                .labelsHidden()
                        }
                        .frame(height: 65)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 9).fill(
                                Color(
                                    red: 217 / 255,
                                    green: 217 / 255,
                                    blue: 217 / 255
                                )
                            )
                        )
                    } else if smartDevice.wrappedValue.type == .thermostat {
                        HStack {
                            Image(systemName: "thermometer.high")   .font(.system(size: 32))
                            Spacer()
                            VStack {
                                Text(smartDevice.wrappedValue.name)
                                    .font(Fonts.deviceName)
                                Spacer()
                                Text(smartDevice.wrappedValue.type.rawValue)
                                    .font(Fonts.deviceTypeName)
                            }
                            .padding()
                            Spacer()
                            VStack {
                                Text("\(String(format: "%.0f", smartDevice.wrappedValue.temperature))°C")
                                    .font(Fonts.temperatureLabel)
                                Stepper("", value: smartDevice.temperature, step: 1)
                                    .labelsHidden()
                            }
                        }
                        .frame(height: 65)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 9).fill(
                                Color(
                                    red: 217 / 255,
                                    green: 217 / 255,
                                    blue: 217 / 255
                                )
                            )
                        )
                    } else {
                        HStack {
                            Image(systemName: "lock.fill")   .font(.system(size: 32))
                            Spacer()
                            VStack {
                                Text(smartDevice.wrappedValue.name)
                                    .font(Fonts.deviceName)
                                Spacer()
                                Text(smartDevice.wrappedValue.type.rawValue)
                                    .font(Fonts.deviceTypeName)
                            }
                            .padding()
                            Spacer()
                            Toggle("", isOn: smartDevice.isLocked)
                                .labelsHidden()
                        }
                        .frame(height: 65)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 9).fill(
                                Color(
                                    red: 217 / 255,
                                    green: 217 / 255,
                                    blue: 217 / 255
                                )
                            )
                        )
                    }
                }
            }
            .padding()
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
