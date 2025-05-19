//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Rylie Castell on 19.05.25.
//

import SwiftUI

struct SmartHomeView: View {
    @State var inputs: [String] = []
    @State var textInput: String = ""
    @State var roomViewIsVisible: Bool = false

    var body: some View {
        Spacer()
        VStack {
            HStack {
                TextField("Gib einen Namen ein...", text: $textInput)
                Button("Hinzufügen") {
                    if textInput.count >= 1 {
                        inputs.append(textInput)
                        textInput = ""
                    }
                }
            }
            .padding()
        }
        ForEach(inputs, id: \.self) { input in
            Text(input)
        }
        Spacer()
        if roomViewIsVisible {
            RoomView(roomViewIsVisible: $roomViewIsVisible)
        }
        Toggle("Raumvorschau anzeigen", isOn: $roomViewIsVisible)
            .padding()
    }
}

#Preview {
    SmartHomeView()
}
