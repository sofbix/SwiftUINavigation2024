//
//  LastView.swift
//  Navigation
//
//  Created by Sergey Balalaev on 26.12.2024.
//


import SwiftUI
import SUINavigation

struct LastView: View {

    var string: String

    @State
    var isSecondShow = false

    @OptionalEnvironmentObject
    var navigationStorage: NavigationStorage?

    var body: some View {
        VStack {
            Text("Last with \(string)")
            Button("full Second"){
                isSecondShow = true
            }
            Button("replace"){
                navigationStorage?.replaceDestination(with: Root.first)
            }
        }
        .navigationTitle("last screen")
        .fullScreenCover(isPresented: $isSecondShow) {
            SecondView()
        }
        .navigateUrlParams("FullSecond") { path in
            isSecondShow = true
        }
    }
}

#Preview {
    LastView(string: "")
}
