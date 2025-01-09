//
//  ContentView.swift
//  BetterYOU
//
//  Created by Сухарик on 21.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            BetterSleep()
                .tabItem {
                    Image(systemName: "bed.double.fill")
                    Text("Sleep")
                }
            BetterWork()
                .tabItem {
                    Image(systemName: "figure.run")
                    Text("Work")
                }
            BetterEat()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Food")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
}
