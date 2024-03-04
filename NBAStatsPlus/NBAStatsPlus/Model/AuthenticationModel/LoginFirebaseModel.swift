//
//  LoginFirebaseModel.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-02.
//


import Foundation
import UIKit
import FirebaseAuth

class LoginFirebaseModel {
    
    //MARK: Variable Initalization
    static let shared = LoginFirebaseModel() // Singleton Instance
    private init () {} // Singleton Constructor
    
    
    // Function to handle when the user attemps to login
    func handleLogin(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        
        // Trying to sign in the user
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { result, error in
    
            if let error = error {
                // Error Signing Up
                completion(false, error)
            } else {
                // Signing in worked!
                print("The User Has Signed In")
                completion(true, nil)
            }
            
        })
    }
}

