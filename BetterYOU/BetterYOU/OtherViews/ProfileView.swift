//
//  ProfileView.swift
//  BetterYOU
//
//  Created by Сухарик on 22.11.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("goalFood") var goalFood = "2000"
    @AppStorage("goalTrain") var goalTrain = "3"
    @AppStorage("goalStep") var goalStep = "10000"
    @AppStorage("goalSleep") var goalSleep = "8"
    @FocusState var isFocused: Bool
    
    @State private var selectedUnitw = SettingsView().selectedUnitW
    @State private var selectedUnith = SettingsView().selectedUnitH
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Image("profilePhoto")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 130, height: 130, alignment: .center)
                        .padding(.leading, 96)
                }
                .listRowBackground(Color.clear)
                .listSectionSpacing(-10)
                
                Section {
                    HStack {
                        Text("Full name: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(SettingsView().firstName) \(SettingsView().lastName)")
                    }
                    
                    //                    Text("Surname: \(SettingsView().lastName)")
                    //                        .multilineTextAlignment(.trailing)
                    
                    HStack {
                        Text("Age: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(SettingsView().age) years")
                    }
                    
                    HStack {
                        Text("Weight: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(SettingsView().weight)")
                        if selectedUnitw == 0 {
                            Text("kg")
                        } else {
                            Text("lbs")
                        }
                    }
                    
                    HStack {
                        Text("Height: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(SettingsView().height)")
                        if selectedUnith == 0 {
                            Text("cm")
                        } else {
                            Text("ft")
                        }
                    }
                    
                }header: {
                    Text("Information about yourself")
                        .foregroundStyle(Color(.text))
                }
                
                Section {
                    HStack {
                        Text("Food: ")
                        TextField("enter amount", text: $goalFood)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .focused($isFocused)
                        Text("kcal")
                    }
                    
                    HStack {
                        Text("Trainings: ")
                        TextField("enter amount", text: $goalTrain)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .focused($isFocused)
                        if Int(goalTrain) ?? 0 > 1 && Int(goalTrain) ?? 0 < 4 {
                            Text("times")
                        } else {
                            Text("time")
                        }
                    }
                    
                    HStack {
                        Text("Steps: ")
                        TextField("enter amount", text: $goalStep)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .focused($isFocused)
                        Text("steps")
                    }
                    
                    HStack {
                        Text("Sleep: ")
                        TextField("enter amount", text: $goalSleep)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .focused($isFocused)
                        Text("hours")
                    }
                }header: {
                    Text("Your goals")
                        .foregroundStyle(Color(.text))
                }
            }
            .onTapGesture {
                isFocused.toggle()
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
