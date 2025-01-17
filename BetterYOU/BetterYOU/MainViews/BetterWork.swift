//
//  BetterWork.swift
//  BetterYOU
//
//  Created by Сухарик on 21.11.2024.
//

import SwiftUI

struct BetterWork: View {
    
    @State var stepsAmount = 9000
    @State var trainingsAmount = 4
    @State private var showingStat = false
    @State private var goalAmount = 5
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Your goal for week is \(goalAmount) training")
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
                        Image(systemName: "figure.walk.motion")
                        Stepper("\(stepsAmount.formatted()) steps", value: $stepsAmount, in: 1000...30000, step: 1000)
                    }
                }header: {
                    Text("Amount of steps today")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    HStack {
                        Image(systemName: "figure.skateboarding")
                        Picker("\(trainingsAmount) trainings", selection: $trainingsAmount) {
                            ForEach(1...7, id: \.self) {
                                Text("\($0) trainings")
                            }
                        }
                    }
                } header: {
                    Text("Amount of trainings per week")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    if stepsAmount >= 10000 {
                        Text("Well done! Goal for today achieved 🥳")
                        //.frame(width: 400,height: 68, alignment: .center)
                        //.font(.system(size: 20))
                        
                    } else {
                        Text("You need to walk at least 10000 steps to achieve the goal 😅")
                        //.font(.system(size: 20))
                        //.padding(10)
                    }
                } header: {
                    Text("Results")
                        .foregroundStyle(Color(.text))
                }
                
            }
            
            .navigationTitle("Better Work 🏋🏽‍♂️")
            /*.navigationBarItems(trailing: Button() {
                showingStat.toggle()
            } label: {
                Image(systemName: "align.horizontal.right.fill")
            }
            )
            .sheet(isPresented: $showingStat) {
                StatisticsView()
            }         этот алгоритм открывает вью пушем поверх вью Better Work */
            
            // этот алгоритм открывает вью в новом окне с добавлением кнопки "назад"
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: StatisticsView()) {
                            Image(systemName: "align.horizontal.right.fill")
                        }
                    }
                }
            //.navigationBarTitleDisplayMode(.inline)
                .scrollContentBackground(.hidden)
                .background(Color.work)
        }
    }
}

#Preview {
    BetterWork()
}
