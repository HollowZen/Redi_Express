//
//  SupaBaseApi.swift
//  Redi_Express
//
//  Created by user on 12.10.2024.
//

import Foundation
import Supabase

class SupaBaseApi{
    // паттерн instance
    static let instance = SupaBaseApi()
    
    // подключение supabase
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://oypyokybpedbvbcokaaz.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im95cHlva3licGVkYnZiY29rYWF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg3MDQxNDUsImV4cCI6MjA0NDI4MDE0NX0.O2suCPTwHuum5zMAwtLeEP9CDXFS_A2HsAaukSVw-lY"
    )
    
    // регистрация в supabase
    func signUp(name: String, phone: String, email: String, password: String) async throws {
        try await supabase.auth.signUp(email: email, password: password)
        let user = try await supabase.auth.session.user
        let newUser = UserModel(id: user.id, name: name, phone: phone, created_at: .now)
        try await supabase.from("users")
            .insert(newUser)
            .execute()
        try await supabase.auth.signOut()
    }
    // вход в supabase
    func logIn(email: String, password: String) async throws {
        
        try await supabase.auth.signIn(email: email, password: password)
        
    }
    // функция, выходf из аккаунта
    func logOut() async throws {
        try await supabase.auth.signOut()
    }
}
