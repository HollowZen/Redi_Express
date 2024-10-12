//
//  LogInView.swift
//  Redi_Express
//
//  Created by user on 12.10.2024.
//

import SwiftUI

struct LogInView: View {
    @StateObject var userViewModel=UserViewModel()
    @State var email = ""
    @State var pass = ""
    @State private var checkBox = false
    
    var body: some View{
        VStack (alignment: .leading, spacing: 10)
        {
            
            Text("Welcome Back")
                .font(.system(size:20, weight: .bold))
            Text("Fill in your email and password to continue")
                .font(.system(size:15))
                .opacity(0.5)
            Text("")
            Text("Email Address")
                .opacity(0.5)
            TextField("*********@mail.com", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Password")
                .opacity(0.5)
            SecureField("*********", text: $pass)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack(alignment: .center)
            {
                CheckBox(value: $checkBox)
                Text("Remember password")
                    .font(.system(size:10))
                    .opacity(0.5)
                Spacer()
                NavigationLink {
                    ForgotPasswordView()
                } label: {
                    Text("Forgot password?")
                        .font(.system(size:10))
                        .opacity(0.5)
                }
            }
            Button(action:{
                
                
            }){
                VStack {
                    VStack{
                        Button (action: {
                            userViewModel.logIn()
                            HomeView()
                        },
                                label: {
                            Text("Log in")
                                .frame(minWidth: 30,maxWidth:.infinity )
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.gray)
                                .cornerRadius(10)
                        })
                        
                        
                    }
 
                    HStack{
                        Text("Already have an account?").foregroundColor(.black)
                        NavigationLink  (destination: {
                            SignUpView()
                        }, label: {
                            Text("Sign Up").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        })
                        


                    }
                    
                    .opacity(0.5)
                    .font(.system(size:10))
                    Text("or log in using")
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .font(.system(size:10))
                }
            }
            
        }
        .padding(.horizontal,20)
        .navigationBarHidden(true)
        .font(.custom("Roboto-Italic", size: 14))
    }
    
}

#Preview {
    LogInView()
}
