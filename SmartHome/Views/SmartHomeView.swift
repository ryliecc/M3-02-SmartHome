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

    var body: some View {
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
    }
}

#Preview {
    SmartHomeView()
}
