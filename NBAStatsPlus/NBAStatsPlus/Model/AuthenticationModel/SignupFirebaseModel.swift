//
//  SignupFirebaseModel.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-02.
//

import Foundation
import UIKit
import FirebaseAuth


class SignupFirebaseModel {
    
    //MARK: Variables and Instances Declarations
    let signupView: SignupPageUI

    // Initialize LoginFirebase with a LoginView instance
    init(signupView: SignupPageUI) {
        self.signupView = signupView
    }
    
    // Takes in the email and password and adds it to the firebase databse
    func handleSignup(email: String, password: String) {
        
        // Get Authentication Instance
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self]result, error in
            
            // Creating strong self
            guard let strongSelf = self else {
                return
            }
            
            // Checking if there was an error
            guard error == nil else {
                print("Account Creation Failed")
                strongSelf.signupView.setErrorMessage(message: "Account Creation Failed. Please Try Again")
                return
            }
            
            // Account Creation Is Successful
            strongSelf.signupView.signupToMainScreen()
        })
    
    }

}

