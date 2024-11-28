//
//  BetterEat.swift
//  BetterYOU
//
//  Created by Сухарик on 21.11.2024.
//

import SwiftUI

struct BetterEat: View {

    @State private var proteins: String = ""
    @State private var fats: String = ""
    @State private var carbohydrates: String = ""
    @State private var goalAmount = 2000
    @State private var kсalAmount = 2000
    @State private var selectedUnit = ProfileView().selectedUnitF
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Your goal for today is \(goalAmount.formatted()) kcal")
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
                        Image(systemName: "clock")
                        Stepper("\(kсalAmount.formatted()) kсal", value: $kсalAmount, in: 1000...5000, step: 100)
                    }
                }header: {
                    Text("Amount of kcal today")
                        .foregroundStyle(Color(.text))
                }

                
                Section {
                    VStack {
                        HStack {
                            Text("Proteins:")
                            TextField("enter amount", text: $proteins)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                            if selectedUnit == 0 {
                                Text("g")
                            } else {
                                Text("p")
                            }
                            Button {
                                hideKeyboard()
                            } label: {
                                Image(systemName:"checkmark.circle")
                            }
                        }
                        HStack {
                            Text("Fats:")
                            TextField("enter amount", text: $fats)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                            if selectedUnit == 0 {
                                Text("g")
                            } else {
                                Text("p")
                            }
                            Button {
                                hideKeyboard()
                            } label: {
                                Image(systemName:"checkmark.circle")
                            }
                        }
                        HStack {
                            Text("Carbohydrates:")
                            TextField("enter amount", text: $carbohydrates)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                            if selectedUnit == 0 {
                                Text("g")
                            } else {
                                Text("p")
                            }
                            Button {
                                hideKeyboard()
                            } label: {
                                Image(systemName:"checkmark.circle")
                            }
                            
                        }
                    }
                } header: {
                    Text("Amount of PFC")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    if kсalAmount == 2000 {
                        Text("Well done! Goal for today achieved 🥳")
                        //.frame(width: 400,height: 48, alignment: .center)
                        //.font(.system(size: 20))
                        
                    } else if kсalAmount < 2000{
                        Text("You need to eat more to achieve the goal 😑")
                            //.font(.system(size: 20))
                        //.padding(10)
                    } else {
                        Text("You need to eat less to achieve the goal 😅")
                            //.font(.system(size: 20))
                        //.padding(10)
                    }
                } header: {
                    Text("Results")
                        .foregroundStyle(Color(.text))
                }
                
            }
            .navigationTitle("Better Eat 🥗")
            //.navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(Color.eat)
        }
    }
}

#Preview {
    BetterEat()
}
