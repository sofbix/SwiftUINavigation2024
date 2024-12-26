//
//  FirstView.swift
//  Navigation
//
//  Created by Sergey Balalaev on 26.12.2024.
//

import SwiftUI
import SUINavigation

struct FirstView: View {

    @OptionalEnvironmentObject
    var navigationStorage: NavigationStorage?

    var body: some View {
        VStack{
            Text("First")
            Button("to Second") {
                navigationStorage?.replaceDestination(with: Root.second)
            }
        }
        .padding()
        .navigationTitle("First screen")
    }
}

#Preview {
    FirstView()
}
