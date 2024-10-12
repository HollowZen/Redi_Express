//
//  NewPasswordView.swift
//  Redi_Express
//
//  Created by user on 12.10.2024.
//

import SwiftUI

struct NewPasswordView: View {
    
    @State var password: String = ""
    @State var passwordConfigrm: String = ""
    @State var checkPassword: Bool = false
    
    func passwordMatch() {
        if !password.isEmpty && password == passwordConfigrm {
            checkPassword = true
        } else {
            checkPassword = false
        }
    }
    
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        
        VStack {
            Text("New Password")
                .font(.system(size: 30, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
                .padding(.top, 100)
            Text("Enter new password")
                .font(.system(size: 14))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            VStack(alignment: .leading) {
                Text("Password")
                    .opacity(0.5)
                TextField("*********", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: password) {
                    passwordMatch()
                }
                Text("Confirm Password")
                    .opacity(0.5)
                TextField("***********", text: $passwordConfigrm
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: passwordConfigrm) {
                    passwordMatch()
                }
            }
            
            
            if !checkPassword {
                Text("Log In")
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(checkPassword ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 30)
                    .foregroundColor(.white)
            } else {
                NavigationLink("Log In", destination: HomeView())
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(checkPassword ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding(.top, 30)
                    .foregroundColor(.white)
            }
            
            Spacer()
        }
        .padding(25)
        .navigationBarBackButtonHidden(true)
        .font(.custom("Roboto-Italic", size: 14))
    }
}

#Preview {
    NewPasswordView()
}