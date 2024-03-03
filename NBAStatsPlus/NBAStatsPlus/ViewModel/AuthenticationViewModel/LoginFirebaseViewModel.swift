//
//  LoginFirebaseViewModel.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-02.
//

import Foundation

class LoginFirebaseViewModel {
    
    // Instance of model
    private let loginModel: LoginFirebaseModel
    
    // Constructor
    init(loginModel: LoginFirebaseModel = LoginFirebaseModel.shared) {
        // Default parameter is LoginFirebaseModel.shared
        self.loginModel = loginModel
    }
    
    // Calls on the Model to handle the signup
    func handleLogin(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        LoginFirebaseModel.shared.handleLogin(email: email, password: password, completion: completion)
    }
}
