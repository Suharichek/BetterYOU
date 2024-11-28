//
//  StatisticsView.swift
//  BetterYOU
//
//  Created by Сухарик on 22.11.2024.
//

import SwiftUI

struct StatisticsView: View {
    
    @State private var progressStep = Double(BetterWork().stepsAmount) / 10000
    @State private var progressTrainings = Double(BetterWork().trainingsAmount) / 5
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form {
                // .listRowBackground(Color.clear)  для отключения рамок
                
                Section {
                    HStack {
                        Image(systemName: "figure.walk.motion")
                        Text("You have done \(BetterWork().stepsAmount) steps")
                        ActivityRing(progress: Double(progressStep), ringColor: .green)
                            .frame(width: 150, height: 150, alignment: .center)
                            .padding()
                    }
                }header: {
                    Text("Amount of steps today")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    HStack {
                        Image(systemName: "figure.skateboarding")
                        Text("You have \(BetterWork().trainingsAmount) training")
                        ActivityRing(progress: Double(progressTrainings), ringColor: .orange)
                            .frame(width: 150, height: 150, alignment: .center)
                            .padding()
                    }
                } header: {
                    Text("Amount of trainings per week")
                        .foregroundStyle(Color(.text))
                }
                
                
            }
            .navigationTitle("Statistics")
            /* служит для кнопки закрытия вью
             
            .navigationBarItems(trailing: Button("Done") {
                dismiss()
            }) */
            .scrollContentBackground(.hidden)
            .background(Color.stat)
        }
    }
}

#Preview {
    StatisticsView()
}
