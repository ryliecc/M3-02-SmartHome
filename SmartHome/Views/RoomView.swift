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
        Image(systemName: "house.fill")
            .font(.system(size: 50))
            .foregroundColor(.white)
            .scaledToFit()
            .frame(width: 100, height: 100)
            .background(Color(.orange))
    }
}

#Preview {
    @Previewable @State var roomViewIsVisible: Bool = true
    RoomView(roomViewIsVisible: $roomViewIsVisible)
}
