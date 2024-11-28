//
//  ContentView.swift
//  BetterYOU
//
//  Created by Сухарик on 21.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [:]
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var bedtimeText = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
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
