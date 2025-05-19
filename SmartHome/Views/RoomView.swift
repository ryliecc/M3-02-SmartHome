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
            ZStack {
                Image(systemName: "house.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .background(Color(.orange))
                    .border(.black)
                Button {
                    roomViewIsVisible = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                }
                .offset(x: 115, y: -115)
            }
        }
    }
}

#Preview {
    @Previewable @State var roomViewIsVisible: Bool = true
    RoomView(roomViewIsVisible: $roomViewIsVisible)
}
