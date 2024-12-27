//
//  SecondView.swift
//  Navigation
//
//  Created by Sergey Balalaev on 26.12.2024.
//

import SwiftUI
import SUINavigation

struct SecondView: View {

    @State
    var lastString: String?

    var body: some View {
        VStack {
            Text("Second")
            Button("to Last with 222"){
                lastString = "222"
            }
        }
        .navigationTitle("second screen")
        .navigationAction(item: $lastString, id: "Last", paramName: "st") { value in
            Path.last(value)
        }
    }
}

#Preview {
    SecondView()
}
