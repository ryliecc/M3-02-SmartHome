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
        if roomViewIsVisible {
            VStack {
                Spacer()
                ZStack {
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
                                .foregroundStyle(.black)
                                .frame(width: 32, height: 32)
                                .background(Color(red: 88 / 255, green: 75 / 255, blue: 83 / 255))
                                .clipShape(Circle())
                        }
                        .offset(x: 180, y: -240)
                        .zIndex(2)
                    }
                    
                }
                Toggle(
                    "Raumvorschau schließen",
                    isOn: $roomViewIsVisible
                )
                .padding()
            }
        }
        if !roomViewIsVisible {
            VStack {
                Spacer()
                Toggle(
                    "Raumvorschau anzeigen",
                    isOn: $roomViewIsVisible
                )
                .padding()
            }
        }
    }
}

#Preview {
    @Previewable @State var roomViewIsVisible: Bool = true
    RoomView(roomViewIsVisible: $roomViewIsVisible)
}
