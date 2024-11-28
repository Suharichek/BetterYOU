//
//  BetterRest.swift
//  BetterYOU
//
//  Created by Сухарик on 21.11.2024.
//

//import SwiftUI
//
//struct BetterRest: View {
//    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [:]
//    }
//    
//    @State private var wakeUp = defaultWakeTime
//    @State private var sleepAmount = 8.0
//    @State private var coffeeAmount = 1
//    
//    @State private var bedtimeText = ""
//    @State private var showingAlert = false
//    
//    static var defaultWakeTime: Date {
//        var components = DateComponents()
//        components.hour = 7
//        components.minute = 0
//        return Calendar.current.date(from: components) ?? .now
//    }
//    
//    var body: some View {
//        NavigationStack {
//            Form {
//                Section {
//                    HStack {
//                        Image(systemName: "bed.double.fill")
//                        DatePicker("Choose time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                    }
//                } header: {
//                    Text("When do you want to wake up?")
//                        .foregroundStyle(Color(.text))
//                }
//                
//                Section {
//                    HStack {
//                        Image(systemName: "clock")
//                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 6...12, step: 0.5)
//                    }
//                }header: {
//                    Text("Desired amount of sleep")
//                        .foregroundStyle(Color(.text))
//                }
//                
//                Section {
//                    HStack {
//                        Image(systemName: "cup.and.saucer")
//                        Picker("\(coffeeAmount) cup", selection: $coffeeAmount) {
//                            ForEach(1...5, id: \.self) {
//                                Text("\($0) cup")
//                            }
//                        }
//                    }
//                } header: {
//                    Text("Daily coffee intake")
//                        .foregroundStyle(Color(.text))
//                }
//                
//                Section {
//                    Text("")
//                        .frame(width: 400,height: 100, alignment: .center)
//                        .font(.system(size: 60))
//                } header: {
//                    Text("Your ideal betime")
//                        .foregroundStyle(Color(.text))
//                }
//                
//            }
//            .navigationTitle("Better Rest 🛌")
//            .navigationBarTitleDisplayMode(.inline)
//            .scrollContentBackground(.hidden)
//            .background(Color.rest)
//        }
//    }
//}
//
//#Preview {
//    BetterRest()
//}
