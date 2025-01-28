//
//  ContentView.swift
//  BetterYOU
//
//  Created by Сухарик on 21.11.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        if isFirstLaunch && !isLoggedIn {
            WelcomeView()
        } else if !isFirstLaunch && !isLoggedIn {
            SignUpView()
        } else {
            HomeView()
        }
    }
}

#Preview {
    ContentView()
}
