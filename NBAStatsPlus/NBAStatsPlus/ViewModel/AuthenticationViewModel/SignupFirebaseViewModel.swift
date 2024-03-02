//
//  SignupFirebaseViewModel.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-02.
//

import Foundation

class SignupFirebaseViewModel {
    
    // Instance of model
    private let signupModel: SignupFirebaseModel
    
    init(signupModel: SignupFirebaseModel) {
        self.signupModel = signupModel
    }
    
    // Calls on the Model to handle the signup
    func handleSignup(email: String, password: String) {
        signupModel.handleSignup(email: email, password: password)
    }
}
