//
//  ContentView.swift
//  Cookit
//
//  Created by 우전 on 11/19/23.
//

import SwiftUI

struct ContentView: View {
  @State private var selection: Tab = .search
  
  enum Tab {
    case search
  }
  
  var body: some View {
    TabView(selection: $selection) {
      MealSearch()
        .tabItem {
          Label("Search", systemImage: "magnifyingglass")
        }
        .tag(Tab.search)
    }
  }
}

#Preview {
  ContentView()
}
