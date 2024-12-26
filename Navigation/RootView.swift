//
//  RootView.swift
//  Navigation
//
//  Created by Sergey Balalaev on 26.12.2024.
//

import SwiftUI
import SUINavigation

enum Tab: String {
    case first
    case second
    case last
}

enum Root: String, NavigationParameterValue {
    init?(_ description: String) {
        self.init(rawValue: description)
    }

    static var defaultValue: Root = .first

    case first
    case second
}

enum Path: Equatable {
    case first
    case second
    case last(String)

    @ViewBuilder
    var view: some View {
        switch self {
        case .first:
            FirstView()
        case .second:
            SecondView()
        case .last(let string):
            LastView(string: string)
        }
    }
}

struct RootView: View {

    @State
    var selectedTab = Tab.first

    @OptionalEnvironmentObject
    var navStorage: NavigationStorage?

    var body: some View {
        TabView(selection: $selectedTab) {
            FirstView()
                .tabItem {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("first")
                }
                .tag(Tab.first)
            SecondView()
                .tabItem {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("second")
                }
                .tag(Tab.second)
            LastView(string: "root")
                .tabItem {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("last")
                }
                .tag(Tab.last)
        }
        .navigationStorageBinding{ (path: Path) in
            path.view
        }
        .navigationStorageDestinationAction(for: Root.self, id: "Root") { root in
            switch root {
            case .second:
                SecondView()
            case .first:
                FirstView()
            }
        }
        .onOpenURL { url in
            let targetURL = url.absoluteString.replacingOccurrences(of: "navster://", with: "")
            navStorage?.replace(with: targetURL)
        }
        .navigateUrlParams("Tab") { path in
            if let item = path.getStringParam("tab"),
               let tab = Tab.init(rawValue: item){
                selectedTab = tab
            }
        }
    }
}
