//
//  ForgotPasswordView.swift
//  Redi_Express
//
//  Created by user on 12.10.2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email = ""
    
    
    var body: some View{
        VStack (alignment: .leading, spacing: 10)
        {
            
            Text("Forgot Password")
                .font(.system(size:20, weight: .bold))
            Text("Enter your email address")
                .font(.system(size:15))
                .opacity(0.5)
            Text("")
            Text("Email Address")
                .opacity(0.5)
            TextField("*********@mail.com", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
            
            
            Button(action:{
                
                
            }){
                VStack {
                    VStack{
                        Text("Send OTP")
                    }
                    .frame(minWidth: 30,maxWidth:.infinity )
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                    
                    
                    HStack{
                        Text("Remember password? Back to").foregroundColor(.black)
                        NavigationLink(destination: SignUpView())
                        {Text("Sign in").foregroundColor(.blue)}
                    }
                
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
    ForgotPasswordView()
}
