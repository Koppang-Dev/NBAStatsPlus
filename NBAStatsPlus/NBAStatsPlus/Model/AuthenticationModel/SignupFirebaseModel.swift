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
    static let shared = SignupFirebaseModel() // Singleton Instance
    private init() {} // Private Init to enforce singleton
    
    // Adds users email and password to Firebase
    func handleSignup(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        
        // Get Authentication Instance
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] result, error in
            
            // Deallocates if self is nil
            guard let strongSelf = self else {
                return
            }
            
            if let error = error {
                // Signup Failed
                completion(false, error)
            } else {
                // Signup worked
                completion(true, nil)
            }
        })
    
    }

}

