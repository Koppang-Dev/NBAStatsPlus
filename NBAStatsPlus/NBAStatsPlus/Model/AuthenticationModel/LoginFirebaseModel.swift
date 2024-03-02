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
    weak var loginPage = LoginView()
    
    // Initialize LoginFirebase with a LoginView instance
      init(loginPage: LoginView) {
          self.loginPage = loginPage
      }

    
    // Function to handle when the user attemps to login
    func handleLogin(email: String, password: String) {
        
        // Trying to sign in the user
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] result, error in
            
            // Deallocates if self is nil
            guard let strongSelf = self else {
                return
            }
            
            // Output Error notification if the login fails
            if let error = error {
                // Altering that information entered is not correct
                strongSelf.loginPage?.setErrorMessage(message: "Email or Password Is Incorrect. Please Try Again")
            }
            
            
            // Sign the User In
            print("The User Has Signed In")
            strongSelf.loginPage?.loginToMainScreen()
            
        })
    }
}

