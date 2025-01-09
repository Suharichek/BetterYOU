//
//  SettingsView.swift
//  BetterYOU
//
//  Created by Сухарик on 28.11.2024.
//

import SwiftUI

struct SettingsView: View {
    
    enum Field {
        case firstName
        case lastName
    }
    
    @State var firstName = "Максим"
    @State var lastName = "Вольнов"
    
    @State var weight = 70
    @State var height = 170
    
    @State var selectedUnitF = 0
    @State var selectedUnitW = 0
    @State var selectedUnitH = 0
    
    @FocusState private var focusedField: Field?
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack {
                        HStack {
                            Text("Name: ")
                            TextField("Name", text: $firstName)
                                .keyboardType(.default)
                                .focused($focusedField, equals: .firstName)
                                .textContentType(.givenName)
                                .submitLabel(.next)
                            
                        }
                        HStack {
                            Text("Surname: ")
                            TextField("Surname", text: $lastName)
                                .keyboardType(.default)
                                .focused($focusedField, equals: .lastName)
                                .textContentType(.familyName)
                                .submitLabel(.done)
                        }
                    }
                    .onSubmit {
                        switch focusedField {
                        case .firstName:
                            focusedField = .lastName
                        default:
                            print("")
                        }
                    }
                    
                } header: {
                    Text("What's your name?")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    VStack {
                        HStack {
                            Image(systemName: "scalemass.fill")
                            Text("Your weight: ")
                            if selectedUnitW == 0 {
                                Stepper("\(weight.formatted()) kg", value: $weight, in: 50...150, step: 1)
                            } else {
                                Stepper("\(weight.formatted()) pound", value: $weight, in: 50...150, step: 1)
                            }
                            
                            //Stepper("\(weight.formatted()) kg", value: $weight, in: 50...150, step: 5)
                        }
                        HStack {
                            Image(systemName: "ruler")
                            Text("Your height: ")
                            if selectedUnitH == 0 {
                                Stepper("\(height.formatted()) cm", value: $height, in: 150...250, step: 1)
                            } else {
                                Stepper("\(height.formatted()) foot", value: $height, in: 150...250, step: 1)
                            }
                            //Stepper("\(height.formatted()) cm", value: $height, in: 150...250, step: 5)
                        }
                    }
                }header: {
                    Text("Tell about yourself")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    Picker("Units of food",selection: $selectedUnitF) {
                        Text("gramm")
                            .tag(0)
                        Text("pound")
                            .tag(1)
                    }
                    Picker("Units of weight",selection: $selectedUnitW) {
                        Text("kg")
                            .tag(0)
                        Text("pound")
                            .tag(1)
                    }
                    Picker("Units of height",selection: $selectedUnitH) {
                        Text("cm")
                            .tag(0)
                        Text("foot")
                            .tag(1)
                    }
                } header: {
                    Text("What units do you prefer?")
                        .foregroundStyle(Color(.text))
                }
                
            }
            .navigationTitle("Settings ⚙️")
            //.navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(Color.stat)
        }
    }
}

#Preview {
    SettingsView()
}
