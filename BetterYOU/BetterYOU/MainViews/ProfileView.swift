//
//  ProfileView.swift
//  BetterYOU
//
//  Created by Сухарик on 22.11.2024.
//

import SwiftUI

struct ProfileView: View {
    
    enum Field {
        case firstName
        case lastName
    }
    
    @State  var firstName = "Максим"
    @State  var lastName = "Вольнов"
    @State private var weight = 70
    @State private var height = 170
    @State var selectedUnitF = 0
    @State var selectedUnitW = 0
    @State var selectedUnitH = 0
    @State var amountFood = ""
    @State var amountTrain = ""
    @State var amountSleep = ""
    @FocusState private var focusedField: Field?
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                   // VStack {
                        Text("Name: \(firstName)")
                            //.padding(.bottom)
                        
                        Text("Surname: \(lastName)")
                            //.padding(.bottom)
                        
                        Text("Your weight: \(weight.formatted()) kg")
                            //.padding(.bottom)
                        
                        Text("Your height: \(height.formatted()) cm")
                   // }
                }header: {
                    Text("Information about yourself")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    VStack {
                        HStack {
                            Text("Food: ")
                            TextField("enter amount", text: $amountFood)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                            Text("kcal")
                            //Stepper("\(weight.formatted()) kg", value: $weight, in: 50...150, step: 5)
                        }
                        .padding(.bottom)
                        HStack {
                            Text("Trainings: ")
                            TextField("enter amount", text: $amountTrain)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                            Text("times")
                            
                            //Stepper("\(height.formatted()) cm", value: $height, in: 150...250, step: 5)
                        }
                        .padding(.bottom)
                        HStack {
                            Text("Sleep: ")
                            TextField("enter amount", text: $amountSleep)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                            Text("hours")
                            //Stepper("\(weight.formatted()) kg", value: $weight, in: 50...150, step: 5)
                        }
                    }
                }header: {
                    Text("Your goals")
                        .foregroundStyle(Color(.text))
                }
            }
            .navigationTitle("Profile 👤")
            //.navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(Color.profile)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
