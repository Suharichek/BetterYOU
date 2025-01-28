//
//  SettingsView.swift
//  BetterYOU
//
//  Created by Сухарик on 28.11.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("age") var age: Int = 18
    @AppStorage("weight") var weight: Int = 70
    @AppStorage("height") var height: Int = 170
    
    enum Field {
        case firstName
        case lastName
    }
    
//    @State var firstName = "Максим"
//    @State var lastName = "Вольнов"
//    
//    @State var age = 20
//    @State var weight = 70
//    @State var height = 170
    
    @AppStorage("selectedUnitF") var selectedUnitF = 0
    @AppStorage("selectedUnitW") var selectedUnitW = 0
    @AppStorage("selectedUnitH") var selectedUnitH = 0
    
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
                            Image(systemName: "hourglass")
                                .frame(width: 20, height: 20)
                            Text("Your age: ")
                                .frame(width: 110, height: 20, alignment: .leading)
                            Stepper("\(age.formatted()) years", value: $age, in: 14...60, step: 1)
                        }
                        
                        HStack {
                            Image(systemName: "scalemass.fill")
                                .frame(width: 20, height: 20)
                            Text("Your weight: ")
                                .frame(width: 110, height: 20, alignment: .leading)
                            if selectedUnitW == 0 {
                                Stepper("\(weight.formatted()) kg", value: $weight, in: 50...150, step: 1)
                            } else {
                                Stepper("\(weight.formatted()) pound", value: $weight, in: 50...150, step: 1)
                            }
                            
                            //Stepper("\(weight.formatted()) kg", value: $weight, in: 50...150, step: 5)
                        }
                        HStack {
                            Image(systemName: "ruler")
                                .frame(width: 20, height: 20)
                            Text("Your height: ")
                                .frame(width: 110, height: 20, alignment: .leading)
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
                        Text("ounce")
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
                
                Section {
                    Button{
                        isLoggedIn = false
                    } label: {
                        Text("Log Out")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .foregroundStyle(Color.white)
                    .font(.system(size: 20, weight: .bold))
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.red)
                    )
                    .padding(.vertical, 12)
                }
                .listRowBackground(Color.clear)
                .listSectionSpacing(10)
                
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
