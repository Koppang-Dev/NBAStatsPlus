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
    
    init(signupModel: SignupFirebaseModel = SignupFirebaseModel.shared) {
        self.signupModel = signupModel
    }
    
    
    // Handling User Signup
    func handleSignup(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        // Call on model to perform the signup
        SignupFirebaseModel.shared.handleSignup(email: email, password: password, completion: completion)
    }
}
