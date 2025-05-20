//
//  HeaderView.swift
//  SmartHome
//
//  Created by Rylie Castell on 21.05.25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("Syntax Home")
            .font(Fonts.headerTitle)
            .foregroundColor(
                Color(red: 88 / 255, green: 75 / 255, blue: 83 / 255)
            )
            .frame(width: 402, height: 80, alignment: .top)
            .background(
                LinearGradient(
                    colors: [
                        Color(
                            red: 136 / 255,
                            green: 160 / 255,
                            blue: 168 / 255
                        ), Color.white.opacity(0),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0.36),
                    endPoint: .bottom
                )
            )
    }
}

#Preview {
    HeaderView()
}
