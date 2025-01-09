//
//  ProfileView.swift
//  BetterYOU
//
//  Created by Сухарик on 22.11.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State var goalFood = "2000"
    @State var goalTrain = "3"
    @State var goalStep = "10000"
    @State var goalSleep = "8"
    @FocusState var isFocused: Bool
    
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
                    Text("Name: \(SettingsView().firstName)")
                        .multilineTextAlignment(.trailing)
                    
                    Text("Surname: \(SettingsView().lastName)")
                        .multilineTextAlignment(.trailing)
                    
                    Text("Your weight: \(SettingsView().weight) kg")
                    
                    Text("Your height: \(SettingsView().height) cm")
                    
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
                        Text("times")
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
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isFocused.toggle()
                    }
                }
            }
        }
    }
}


#Preview {
    ProfileView()
}
