//
//  RoomView.swift
//  SmartHome
//
//  Created by Rylie Castell on 20.05.25.
//

import SwiftUI

struct RoomView: View {
    @Binding var roomViewIsVisible: Bool

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                if roomViewIsVisible {
                    VStack {
                        Image("smarthome-example-room")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 403)
                            .zIndex(1)
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
                        .offset(x: 180, y: -240)
                        .zIndex(2)
                    }
                    .offset(y: 140)
                }
                HStack(spacing: 32) {
                    Text("Raumvorschau " + (roomViewIsVisible ? "schließen" : "anzeigen"))
                        .font(Fonts.roomViewLabel)
                        .foregroundColor(.white)
                        .offset(y: roomViewIsVisible ? 56 : 10)
                    Toggle(
                        "",
                        isOn: $roomViewIsVisible
                    )
                    .labelsHidden()
                    .padding()
                    .offset(y: roomViewIsVisible ? 56 : 10)
                }
                .padding()
                .zIndex(3)
                .frame(height: roomViewIsVisible ? 141 : 50)
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
                        startPoint: UnitPoint(x: 0.5, y: 0.6),
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
    @Previewable @State var roomViewIsVisible: Bool = false
    RoomView(roomViewIsVisible: $roomViewIsVisible)
}
