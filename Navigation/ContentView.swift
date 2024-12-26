//
//  ContentView.swift
//  Navigation
//
//  Created by Sergey Balalaev on 26.12.2024.
//

import SwiftUI
import SUINavigation

struct ContentView: View {
    var body: some View {
        NavigationStorageView {
            RootView()
                .navigationTitle("root")
        }
    }
}

#Preview {
    ContentView()
}
