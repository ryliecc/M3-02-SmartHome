//
//  RoomView.swift
//  SmartHome
//
//  Created by Rylie Castell on 20.05.25.
//

import SwiftUI

struct RoomView: View {
    @Binding var roomViewIsVisible: Bool
    @Binding var smartDevices: [SmartDevice]

    var body: some View {
        ZStack {
            VStack {
                if roomViewIsVisible {
                    VStack {
                        RoomPreviewView(smartDevices: $smartDevices)
                        Button {
                            roomViewIsVisible = false
                        } label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 16))
                                .foregroundStyle(.white)
                                .frame(width: 32, height: 32)
                                .background(
                                    Color(
                                        red: 88 / 255,
                                        green: 75 / 255,
                                        blue: 83 / 255
                                    )
                                )
                                .clipShape(Circle())
                        }
                        .position(x: 370, y: -260)
                    }
                    .position(x: 201, y: 138)
                }
                HStack {
                    Text("Raumvorschau " + (roomViewIsVisible ? "schließen" : "anzeigen"))
                        .frame(minWidth: 190)
                        .font(Fonts.roomViewLabel)
                        .foregroundColor(.white)
                        .position(x: 180, y: roomViewIsVisible ? 50 : 20)
                    Toggle(
                        "",
                        isOn: $roomViewIsVisible
                    )
                    .labelsHidden()
                    .padding()
                    .position(x: 140, y: roomViewIsVisible ? 50 : 20)
                }
                .padding()
                .frame(height: roomViewIsVisible ? 80 : 50)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background( roomViewIsVisible ?
                    LinearGradient(
                        colors: [
                            Color(
                                red: 54 / 255,
                                green: 54 / 255,
                                blue: 53 / 255
                            ), Color(red: 54 / 255,
                                     green: 54 / 255,
                                     blue: 53 / 255).opacity(0),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0.4),
                        endPoint: .top
                    ) : LinearGradient(
                        colors: [
                            Color(
                                red: 54 / 255,
                                green: 54 / 255,
                                blue: 53 / 255
                            ), Color(red: 54 / 255,
                                     green: 54 / 255,
                                     blue: 53 / 255),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0.6),
                        endPoint: .top
                    )
                )
            }
        }
    }
}

#Preview {
    @Previewable @State var roomViewIsVisible: Bool = true
    @Previewable @State var smartDevices: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", type: .light),
        SmartDevice(name: "Heizung", type: .thermostat),
        SmartDevice(name: "Haustür", type: .lock),
    ]
    RoomView(roomViewIsVisible: $roomViewIsVisible, smartDevices: $smartDevices)
}
