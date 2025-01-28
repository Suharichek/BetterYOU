//
//  BetterEat.swift
//  BetterYOU
//
//  Created by Сухарик on 21.11.2024.
//

import SwiftUI

struct BetterEat: View {
    
    @State private var proteins = ""
    @State private var fats = ""
    @State private var carbohydrates = ""
    @State private var goalFood = Int(ProfileView().goalFood)
    @AppStorage("kсalAmount") private var kсalAmount = 2000
    @State private var selectedUnit = SettingsView().selectedUnitF
    @AppStorage("statProteins") private var statProteins = 0
    @AppStorage("statFats") private var statFats = 0
    @AppStorage("statCarbohydrates") private var statCarbohydrates = 0

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Your goal for today is \(goalFood ?? 0) kcal")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.text))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .listRowBackground(Color.clear)
                .listSectionSpacing(-10)
                
                Section {
                    VStack {
                        HStack {
                            Image(systemName: "flame.fill")
                            Stepper("\(kсalAmount.formatted()) kсal", value: $kсalAmount, in: 1000...5000, step: 100)
                        }
                        if kсalAmount == goalFood ?? 0 {
                            Text("Well done! Goal for today achieved 🥳")
                                .multilineTextAlignment(.center)
                        } else if kсalAmount < goalFood ?? 0 {
                            Text("You need to eat more to achieve the goal 😑")
                                .multilineTextAlignment(.center)
                        } else {
                            Text("You need to eat less to achieve the goal 😅")
                                .multilineTextAlignment(.center)
                        }
                    }
                }header: {
                    Text("Amount of kcal today")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    
                }
                
                Section {
                    HStack(alignment: .center) {
                        Image(systemName:"fish")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Proteins:")
                        TextField("0", text: $proteins)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                        if selectedUnit == 0 {
                            Text("g")
                        } else {
                            Text("oz")
                        }
                        Button {
                            tapSave()
                            hideKeyboard()
                        }
                        label: {
                            Image(systemName:"checkmark.circle.fill")
                        }
                    }
                    HStack {
                        Image(systemName:"drop")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Fats:")
                        TextField("0", text: $fats)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                        if selectedUnit == 0 {
                            Text("g")
                        } else {
                            Text("oz")
                        }
                        Button {
                            tapSave()
                            hideKeyboard()
                        } label: {
                            Image(systemName:"checkmark.circle.fill")
                        }
                    }
                    HStack {
                        Image(systemName:"cube")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Carbohydrates:")
                        TextField("0", text: $carbohydrates)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                        if selectedUnit == 0 {
                            Text("g")
                        } else {
                            Text("oz")
                        }
                        Button {
                            tapSave()
                            hideKeyboard()
                        } label: {
                            Image(systemName:"checkmark.circle.fill")
                        }
                    }
                } header: {
                    Text("Amount of PFC")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    HStack {
                        Text("Proteins intake: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(statProteins)")
                        if selectedUnit == 0 {
                            Text("g")
                        } else {
                            Text("oz")
                        }
                    }
                    HStack {
                        Text("Fats intake: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(statFats)")
                        if selectedUnit == 0 {
                            Text("g")
                        } else {
                            Text("oz")
                        }
                    }
                    HStack {
                        Text("Carbohydrates intake: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(statCarbohydrates)")
                        if selectedUnit == 0 {
                            Text("g")
                        } else {
                            Text("oz")
                        }
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        statProteins = 0
                        statFats = 0
                        statCarbohydrates = 0
                    }) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                    }
                }
            }
        }
    }
    
    func tapSave() {
        statProteins += Int(proteins) ?? 0
        statFats += Int(fats) ?? 0
        statCarbohydrates += Int(carbohydrates) ?? 0
        proteins = ""
        fats = ""
        carbohydrates = ""
        
    }
}

#Preview {
    BetterEat()
}
