//
//  Repositories.swift
//  Demo_8
//
//  Created by User on 28.09.2024.
//

import Foundation

import Supabase

class Repositories {
              // паттерн instance
    static let instance = Repositories()

    // подключение supabase
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://kwtxriquexerrknoktgg.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3dHhyaXF1ZXhlcnJrbm9rdGdnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjcyMzA0MzgsImV4cCI6MjA0MjgwNjQzOH0.CYgiRt0IkHrPev1JbOuZBHXnNpjYqT3e-nP2pww3HKQ",
        options: .init())
    
    func signUp(name: String, phone: String, email: String, password: String) async throws {
        
        
            try await supabase.auth.signUp(email: email, password: password)
            
            let user = try await supabase.auth.session.user
            
            let newUser = UserModel(id: user.id, name: name, phone: phone, created_at: .now)
            
            try await supabase.from("users")
                .insert(newUser)
                .execute()
            
            try await supabase.auth.signOut()
        }
    
    func signIn(email: String, password: String) async throws {
        
        
            try await supabase.auth.signIn(email: email, password: password)
            
            
        }

    
    }
