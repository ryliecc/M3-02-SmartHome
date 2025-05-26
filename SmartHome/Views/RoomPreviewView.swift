//
//  RoomPreviewView.swift
//  SmartHome
//
//  Created by Rylie Castell on 21.05.25.
//

import SwiftUI

struct RoomPreviewView: View {
    @Binding var smartDevices: [SmartDevice]

    var lamps: [SmartDevice] { smartDevices.filter { $0.type == .light } }
    var thermostats: [SmartDevice] {
        smartDevices.filter { $0.type == .thermostat }
    }
    var locks: [SmartDevice] { smartDevices.filter { $0.type == .lock } }

    var body: some View {
        Grid(horizontalSpacing: 24, verticalSpacing: 16) {
            GridRow {
                ForEach(lamps, id: \.id) { lamp in
                    Image(systemName: lamp.isOn ? "lightbulb.fill" : "lightbulb")
                        .font(.system(size: 40))
                        .foregroundStyle(lamp.isOn ? .yellow : .black)
                }
            }
            GridRow {
                ForEach(thermostats, id: \.id) { thermostat in
                    Gauge(value: thermostat.temperature, in: 0.0...40.0) {
                        Text("")
                    } currentValueLabel: {
                        Text("\(String(format: "%.0f", thermostat.temperature))°C")
                    }
                    .gaugeStyle(.accessoryCircular)
                    .tint(AngularGradient(
                        gradient: Gradient(colors: [.red, .blue, .blue]),
                        center: .top
                    ))
                }
            }
            GridRow {
                ForEach(locks, id: \.id) { lock in
                    Image(systemName: lock.isLocked ? "lock.fill" : "lock.open.fill")
                        .font(.system(size: 40))
                }
            }
        }
        .frame(height: 284)
        .frame(maxWidth: .infinity)
        .background(Color(
            red: 136 / 255,
            green: 160 / 255,
            blue: 168 / 255
        ))
    }
}

#Preview {
    @Previewable @State var smartDevices: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", type: .light),
        SmartDevice(name: "Wohnzimmerlicht", type: .light),
        SmartDevice(name: "Wohnzimmerlicht", type: .light),
        SmartDevice(name: "Heizung", type: .thermostat),
        SmartDevice(name: "Haustür", type: .lock),
        SmartDevice(name: "Haustür", type: .lock),
    ]
    RoomPreviewView(smartDevices: $smartDevices)
}
