//
//  LoginView.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-02.
//

import Foundation
import UIKit

class LoginView: UIViewController {
    
    //MARK: Initalizing Variables
    
    // Lazy means the value is not calculated until the first time it is needed
    lazy var firebaseObj: LoginFirebase = {
           return LoginFirebase(loginPage: self)
       }()
       
    // Initalizing Top View
    let viewHelper = SignupPageUI()
    let viewStack = UIStackView()
    let topView = SignupTopView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    var emailField = UITextField()
    var passwordField = UITextField()
    
    
    // Initalizing the basketball logo image
    private let basketballImage: UIImageView = {
        // Check if image is found
        if let image = UIImage(named: "basketballLogo") {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            return imageView
        } else {
            fatalError("The Basketball image was not found")
        }
    }()
    
    // Initalizing the login label
    private let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Login"
        loginLabel.textAlignment = .center
        loginLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        return loginLabel
    }()
    
    // Initalizing the login button
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemOrange
        loginButton.layer.cornerRadius = 15
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // When login button is tapped
        loginButton.addTarget(self, action: #selector(loginPressed(_:)), for: .touchUpInside)
        return loginButton
    }()
    
    
    
    // Initalizing the signup button
    private let signupButton: UIButton = {
        let signupButton = UIButton()
        let title = "Signup"
        let attributedString = NSAttributedString(
            string: title,
            attributes: [
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        // Set the attributed string as the title for the button
        signupButton.setAttributedTitle(attributedString, for: .normal)
        signupButton.setTitleColor(.lightGray, for: .normal)
        
        //When signup button is tapped
        signupButton.addTarget(self, action: #selector(signupPressed(_:)), for: .touchUpInside)
        return signupButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        //MARK: Function Calls
        setTextFields()
        layout()
        addTapGestureRecongnition()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Setting the shadow illusion for the top view
        topView.applyShadow()
    }
    
    
    func layout() {
        // Top view
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding Basketball Logo to the top view
        topView.addSubview(basketballImage)
        basketballImage.translatesAutoresizingMaskIntoConstraints = false
        
        // View Stack
        viewStack.axis = .vertical
        viewStack.spacing = 35
        
        viewStack.addArrangedSubview(loginLabel)
        viewStack.addArrangedSubview(emailField)
        viewStack.addArrangedSubview(passwordField)
        viewStack.addArrangedSubview(loginButton)
        viewStack.addArrangedSubview(signupButton)
        
        view.addSubview(viewStack)
        viewStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Setting the NS Constraints for the stack view and all the UI elements
        NSLayoutConstraint.activate([
            
            // Top View
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            // Basketball Logo
            basketballImage.topAnchor.constraint(equalTo: topView.topAnchor , constant: 75),
            basketballImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            basketballImage.widthAnchor.constraint(equalToConstant: 100),
            basketballImage.heightAnchor.constraint(equalToConstant: 100),
   
            // Stackview
            viewStack.topAnchor.constraint(equalTo: basketballImage.bottomAnchor, constant: 100),
            viewStack.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
        ])
    }
}


//MARK: @objc functions
extension LoginView {
    
    // Transitioning to the Signup view controller
    @objc func signupPressed(_ sender: UIButton) {
        let vc = SignupPageUI()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func loginPressed(_ sender: UIButton) {
        
        print("User Attempts to login")
        
        // Checking if the email and password fields contain text
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            print("Missing Data In The Fields")
            setErrorMessage(message: "Please Fill In The Required Fields")
            return
        }
        
        // Check if the login information is correct
       firebaseObj.handleLogin(email: email, password: password)
    }
}



// MARK: Setting UI Components
extension LoginView {
    // Setting the TextFields
    private func setTextFields() {
        emailField = viewHelper.createTextfield(text: "Email Address", imageName: "note.text")
        passwordField = viewHelper.createTextfield(text: "Password", imageName: "key.fill")
    }
    
    
    
    // Displaying an Error Message
    func setErrorMessage(message: String) {
        
        // Initalizing the alert controller
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        // Adding an okay button to the alert pop up
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okButton)
        
        // Present the alert
        present(alertController, animated: true, completion: nil)
    }
}



// Functions to handle View Controller Transitioning
extension LoginView {
    // Going from Login page to Signup page
    public func loginToSignup() {
        let vc = SignupPageUI()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func loginToMainScreen() {
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

// Removing Keyboard if the screen is tapped
extension LoginView {
    
    func addTapGestureRecongnition() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true) // Dismiss the keyboard
    }
}

