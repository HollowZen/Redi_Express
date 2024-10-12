//
//  UserViewModel.swift
//  Redi_Express
//
//  Created by user on 12.10.2024.
//

import Foundation
class UserViewModel: ObservableObject{
    @Published var user = UserModel(id: UUID(), name: "Ivanov", phone: "12345678", created_at: .now)
    
    @Published  var email: String = ""
    @Published  var password: String = ""
    @Published  var confirmPassword: String = ""
    
    @Published  var isProgress: Bool = false
    @Published var isNavigate: Bool = false
    @Published  var error: Bool = false
    
    
    func signUp() {
        
        if user.name != "" {
            Task {
                do {
                    await MainActor.run {
                        self.isProgress = true
                    }
                    try await SupaBaseApi.instance.signUp(name: user.name, phone: user.phone, email: email, password: password)
                    await MainActor.run {
                        self.isNavigate = true
                        self.isProgress = false
                    }
                } catch {
                    print("ERROR: " + error.localizedDescription)
                    await MainActor.run {
                        self.error = true
                        self.isProgress = false
                    }
                }
            }
        }
        else {
        }
        
    }
    
    func logIn() {
        
        Task {
            do{
                await MainActor.run
                {
                    self.isProgress = true
                }
                
                
                try await SupaBaseApi.instance.logIn(email: email, password: password)
                await MainActor.run
                {
                    
                    self.isNavigate = true
                    self.isProgress = false
                    print(isNavigate.description)
                }
                    
                }
            catch
            {
                print(error.localizedDescription)
            }
        }
    }
}
