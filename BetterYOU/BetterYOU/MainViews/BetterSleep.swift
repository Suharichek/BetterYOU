//
//  BetterSleep.swift
//  BetterYOU
//
//  Created by Сухарик on 22.11.2024.
//

import CoreML
import SwiftUI

struct BetterSleep: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var workAmount = 1
    
    @State private var bedtimeText = ""
    @State private var showingAlert = false
    @State private var goalAmount = 7
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Your goal for today is \(goalAmount.formatted()) hours of sleep")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.text))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .listRowBackground(Color.clear)
                
                Section {
                    HStack {
                        Image(systemName: "bed.double.fill")
                        DatePicker("Choose time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    }
                } header: {
                    Text("When do you want to wake up?")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    HStack {
                        Image(systemName: "clock")
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 6...12, step: 0.5)
                    }
                }header: {
                    Text("Desired amount of sleep")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    HStack {
                        Image(systemName: "cup.and.saucer")
                        Picker("\(coffeeAmount) cup", selection: $coffeeAmount) {
                            ForEach(1...5, id: \.self) {
                                Text("\($0) cup")
                            }
                        }
                    }
                } header: {
                    Text("Daily coffee intake")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    HStack {
                        Image(systemName: "pencil.and.outline")
//                        Picker("\(workAmount) hour", selection: $workAmount) {
//                            ForEach(1...12, id: \.self) {
//                                Text("\($0) hour")
//                            }
//                        }
                        Stepper("\(workAmount) hour", value: $workAmount, in: 1...12, step: 1)
                    }
                } header: {
                    Text("Daily workload")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    Text(calculateBedtime())
                        .frame(width: 400,height: 100, alignment: .center)
                        .font(.system(size: 60))
                } header: {
                    Text("Your ideal betime")
                        .foregroundStyle(Color(.text))
                }
                
            }
            .navigationTitle("Better Sleep 🛌")
            //.navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(Color.sleep)
        }
    }
    
    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount), workHours: Double(workAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "Error"
        }
    }

}

#Preview {
    BetterSleep()
}
