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
    
    init(loginModel: LoginFirebaseModel) {
        self.loginModel = loginModel
    }
    
    // Calls on the Model to handle the signup
    func handleLogin(email: String, password: String) {
        loginModel.handleLogin(email: email, password: password)
    }
}
