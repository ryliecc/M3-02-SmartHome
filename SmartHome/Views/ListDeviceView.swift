//
//  ListDeviceView.swift
//  SmartHome
//
//  Created by Rylie Castell on 22.05.25.
//

import SwiftUI

struct ListDeviceView: View {
    @Binding var smartDevices: [SmartDevice]
    var body: some View {
        VStack(spacing: 16) {
            ForEach($smartDevices, id: \.id) { smartDevice in
                if smartDevice.wrappedValue.type == .light {
                    HStack {
                        Image(
                            systemName: smartDevice.wrappedValue.isOn
                                == true ? "lightbulb.fill" : "lightbulb"
                        )
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
                        Image(systemName: "thermometer.high").font(
                            .system(size: 32)
                        )
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
                            Text(
                                "\(String(format: "%.0f", smartDevice.wrappedValue.temperature))°C"
                            )
                            .font(Fonts.temperatureLabel)
                            Slider(value: smartDevice.temperature, in: 0...40)
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
                        Image(
                            systemName: smartDevice.wrappedValue
                                .isLocked == true
                                ? "lock.fill" : "lock.open.fill"
                        ).font(.system(size: 32))
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
                        Button(smartDevice.wrappedValue.isLocked ? "Gesperrt" : "Offen") {
                            smartDevice.wrappedValue.isLocked = !smartDevice.wrappedValue.isLocked
                        }
                        .foregroundColor(.white)
                        .frame(width: 90, height: 34)
                        .background(RoundedRectangle(cornerRadius: 8).fill(smartDevice.wrappedValue.isLocked ? Color(red: 194 / 255, green: 70 / 255, blue: 63 / 255) : Color(red: 88 / 255, green: 75 / 255, blue: 83 / 255)))
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
        .padding()    }
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
    ListDeviceView(smartDevices: $smartDevices)
}
