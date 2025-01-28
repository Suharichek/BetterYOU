//
//  SignUpView.swift
//  BetterYOU
//
//  Created by Сухарик on 25.01.2025.
//

import SwiftUI

enum AuthType {
    case login
    case register
}

struct SignUpView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordAgain: String = ""
    
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    @FocusState private var isPasswordFocusedAgain: Bool
    
    @State private var hasAgreedtoTerm = false
    
    @State private var showPass = false
    
    @State private var authType: AuthType = .login 
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Spacer(minLength: 80)
            TopView(authType: $authType)
            
            if authType == .login {
                VStack(spacing: 15) {
                    TextField(text: $email) {
                        Text("Email")
                    }
                    .focused($isEmailFocused)
                    .textFieldStyle(AuthTextFiledStyle(isFocused: $isEmailFocused))
                    ZStack {
                        
                        TextField(text: $password) {
                            Text("Password")
                        }
                        .focused($isPasswordFocused)
                        .textFieldStyle(AuthTextFiledStyle(isFocused: $isPasswordFocused))
                        .overlay(alignment: .trailing, content: {
                            Button {
                                withAnimation {
                                    showPass.toggle()
                                }
                            } label: {
                                Image(systemName: showPass ? "eye.fill" : "eye.slash.fill")
                                    .padding()
                                    .foregroundStyle(.white)
                            }
                        })
                        .opacity(showPass ? 1 : 0)
                        .zIndex(1)
                        
                        SecureField(text: $password) {
                            Text("Password")
                        }
                        .focused($isPasswordFocused)
                        .textFieldStyle(AuthTextFiledStyle(isFocused: $isPasswordFocused))
                        .overlay(alignment: .trailing) {
                            Button {
                                withAnimation {
                                    showPass.toggle()
                                }
                            } label: {
                                Image(systemName: showPass ? "eye.fill" : "eye.slash.fill")
                                    .padding()
                                    .foregroundStyle(.black)
                            }
                        }
                        .opacity(showPass ? 0 : 1)
                    }
                }
            } else {
                VStack(spacing: 15) {
                    TextField(text: $email) {
                        Text("Email")
                    }
                    .focused($isEmailFocused)
                    .textFieldStyle(AuthTextFiledStyle(isFocused: $isEmailFocused))
                    
                    TextField(text: $password) {
                        Text("Password")
                    }
                    .focused($isPasswordFocused)
                    .textFieldStyle(AuthTextFiledStyle(isFocused: $isPasswordFocused))
                    
                    TextField(text: $passwordAgain) {
                        Text("Password Again")
                    }
                    .focused($isPasswordFocusedAgain)
                    .textFieldStyle(AuthTextFiledStyle(isFocused: $isPasswordFocusedAgain))
                    
                    HStack(alignment: .top) {
                        Toggle(isOn: $hasAgreedtoTerm) {
                            
                        }
                        .toggleStyle(AgreeStyle())
                        
                        Text("I agree to the **Terms** and **Privacy Policy**.")
                    }
                }
            }
            
            Button{
                isLoggedIn = true
            } label: {
                Text(authType == .login ? "Log In" : "Sign Up")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .foregroundStyle(Color.white)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.blue)
            )
            .padding(.vertical, 12)
            
            BottomView(authType: $authType)
        }
        .padding()
        .gesture(
            TapGesture()
                .onEnded({
                    isEmailFocused = false
                    isPasswordFocused = false
                })
        )
        .background(LinearGradient(
            gradient: Gradient(colors: [Color(red: 91/255, green: 61/255, blue: 255/255),
                                        Color(red: 255/255, green: 90/255, blue: 136/255),
                                        Color(red: 70/255, green: 204/255, blue: 255/255)]),
            startPoint: .bottomTrailing,
            endPoint: .topLeading
        ))
    }
}

struct AgreeStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25)
                .contentTransition(.opacity)
        }
        .tint(.primary)
    }
}

struct AuthTextFiledStyle: TextFieldStyle {
    @Environment(\.colorScheme) private var colorScheme
    
    let isFocused: FocusState<Bool>.Binding
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(isFocused.wrappedValue ? Color.blue : Color.gray.opacity(0.5), lineWidth: 1)
                        .zIndex(1)
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(colorScheme == .light ? Color(.systemGray4) : Color(.systemGray2))
                        .zIndex(0)
                    
                }
            )
            .animation(.easeInOut(duration: 0.2), value: isFocused.wrappedValue)
    }
}

struct TopView: View {
    @Binding var authType: AuthType
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75)
            Text(authType == .login ? "Sign In" : "Registration")
                .font(.system(size: 35, weight: .bold, design: .rounded))
        }
    }
}

struct BottomView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var authType: AuthType
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 3) {
                Text(authType == .login ? "Don't have an account?" : "Already have an account?")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                
                Button {
                    if authType == .login {
                        withAnimation {
                            authType = .register
                        }
                    } else {
                        withAnimation {
                            authType = .login
                        }
                    }
                } label: {
                    Text(authType == .login ? "Sign Up" : "Log In")
                        .font(.system(size: 15,weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
            }
            
            HStack {
                Rectangle()
                    .frame(height: 1.5)
                    .foregroundColor(.black)
                Text("OR")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                Rectangle()
                    .frame(height: 1.5)
                    .foregroundColor(.black)
            }
            
            HStack(spacing: 20) {
                Button {
                    isLoggedIn = true
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.5)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.black)
                        .overlay {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                                .foregroundStyle(colorScheme == .light ? .black : .white)
                        }
                }
                
                Button {
                    isLoggedIn = true
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.5)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.black)
                        .overlay {
                            Image("googleIcon")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                        }
                }
                
                Button {
                    isLoggedIn = true
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.5)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.black)
                        .overlay {
                            Image("vkIcon")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                        }
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}
