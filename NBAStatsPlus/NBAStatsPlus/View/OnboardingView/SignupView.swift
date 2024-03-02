//
//  SignupView.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-02.
//

import Foundation
import UIKit

/*
 Class to allow user to log into their account
 Will be setting up FireBase Authentication
    - Facebook, Twitter, Google, Apple, Email & Password
    - Phone number authentication if possible
 */

class SignupPageUI: UIViewController {
    
    //MARK: Variable Initalizing
    let viewModel = SignupViewModel()
    let insideStack = UIStackView()
    var usernameField = UITextField()
    public var emailField = UITextField()
    public var passwordField = UITextField()
    var retypeField = UITextField()
    
    // Firebase Instance
    // Lazy means the value is not calculated until the first time it is needed
    lazy var firebaseObj: SignupFirebase = {
           return SignupFirebase(signupView: self)
       }()
       

    
    
    // Initalizing the top view
    var topView = SignupTopView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    
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
    
    // Initalizing Sign Up label
    private let signupLabel: UILabel = {
        let signupLabel = UILabel()
        signupLabel.text = "Sign Up"
        signupLabel.textAlignment = .center
        signupLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        return signupLabel
    }()
    
    // Initalizing Username Label
    private let usernameTextfield: UITextField = {
        let usernameLabel = UITextField()
        usernameLabel.placeholder = "Username"
        usernameLabel.textAlignment = .center
        usernameLabel.backgroundColor = .systemGray
        return usernameLabel
    }()
    
    // Initalizing the Signup Button
    private let signupButton: UIButton = {
        let signupButton = UIButton()
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.backgroundColor = .systemOrange
        signupButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        signupButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        signupButton.layer.cornerRadius = 15
        signupButton.addTarget(self, action: #selector(signupPressed(_:)), for: .touchUpInside)
        return signupButton
    }()
    
    
    // Initalizing the Login Button
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        let title = "Login"
        
        let attributedString = NSAttributedString(
            string: title,
            attributes: [
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
            ])
        loginButton.setAttributedTitle(attributedString, for: .normal)
        loginButton.backgroundColor = .clear
        loginButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        loginButton.setTitleColor(.systemOrange, for: .normal)
        loginButton.addTarget(self, action: #selector(loginPressed(_:)), for: .touchUpInside)
        return loginButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //MARK: Setting UITextField Delegates
        passwordField.delegate = self
        retypeField.delegate = self
        usernameField.delegate = self
        emailField.delegate = self
        
        //MARK: UI Function Calls
        setTextFields()
        layout()
        addTapGestureRecongnition()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Setting the shadow illusion for the top view
        topView.applyShadow()
    }
}

// MARK: @objc functions
extension SignupPageUI {
    // Log In User
    @objc func loginButtonTapped(_ sender: UIButton) {
        // Creating instance of the mainViewController
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    // Create Users Account
    @objc func createAccountButtonTapped(_ sender: UIButton) {
        
        // Checking to make sure something was entered into the email
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            print("Missing Field Data")
            return
        }
        
        
        print("Create Account Button Pressed")
        /*
        let vc = SignupPageUI()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
         */
    }
    
    
    /*
     Private func can only be used in it's class definition
     withText text:
        - withText is used when using the instance of this function (External Parameter)
        - text is used as the internal parameter name
     */
    private func styleTextField(_ textField: UITextField, withText text: String) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray5
        textField.placeholder = text
        textField.layer.cornerRadius = 8
    }
    
    func layout() {
        
        
        // Top view
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding Basketball Logo to the top view
        topView.addSubview(basketballImage)
        basketballImage.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding the stack view
        insideStack.addArrangedSubview(signupLabel)
        insideStack.addArrangedSubview(usernameField)
        insideStack.addArrangedSubview(emailField)
        insideStack.addArrangedSubview(passwordField)
        insideStack.addArrangedSubview(retypeField)
        insideStack.addArrangedSubview(signupButton)
        insideStack.addArrangedSubview(loginButton)
        
        signupLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        retypeField.translatesAutoresizingMaskIntoConstraints = false
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        insideStack.spacing = 30
        insideStack.axis = .vertical
        
        insideStack.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(insideStack)
        

        
    
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
            insideStack.topAnchor.constraint(equalTo: basketballImage.bottomAnchor, constant: 60),
            insideStack.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
                        

      
            
        ])
    }
}


func setShadowView(view: UIView) -> UIView {
    view.layer.cornerRadius = 10
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
    view.layer.shadowOffset = CGSize(width: 0.0, height : -5.0)
    view.layer.shadowOpacity = 0.6
    view.layer.shadowRadius = 1
    return view
}

func makeButton(withText text: String) -> UIButton {
    let button = UIButton() // Initalizing instance of UIButton
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true // Allowing font size to adjust depending on width
    button.backgroundColor = .systemBlue
    button.layer.cornerRadius = 8
    return button // Returning the created instance of the button
}



/*
 Using UIBezierPath
    - addLine: Drawing Straight line
    - addArc: Drawing any arch of the circle
    - addCurve: Drawing any custom curve
 */
func createBezierCurve() {
    
    
}

// MARK: UI Functions
extension SignupPageUI {
    
    // Create the textfields
    public func createTextfield(text: String, imageName: String) -> UITextField {
        let textField = UITextField()
        
        // Initalizing the vector image
        /*
        let imageView = UIImageView(image: UIImage(systemName: imageName))
        imageView.contentMode = .center
        imageView.tintColor = .black
                
        // Setting the left view of the text field
        // Setting the left view of the text field with padding
        let paddingView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 20)) // Adjust the width as needed
        paddingView.addSubview(imageView)
        
        textField.leftView = paddingView
        textField.leftViewMode = .always
        */
        let image = UIImage(systemName: imageName)
        textField.setLeftView(image: image!)
        
        let attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        textField.attributedPlaceholder = attributedPlaceholder
        textField.textAlignment = .center
        textField.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        textField.layer.cornerRadius = 15
        textField.textColor = .black
        textField.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        textField.widthAnchor.constraint(equalToConstant: 300).isActive =  true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive =  true
        return textField
    }
    
    func setTextFields() {
        usernameField = createTextfield(text: "Username",imageName: "person.fill")
        emailField = createTextfield(text: "Email Address", imageName: "note.text")
        passwordField = createTextfield(text: "Password", imageName: "key.fill")
        retypeField = createTextfield(text: "Retype Password", imageName: "key.fill")
        passwordField.isSecureTextEntry = false
        retypeField.isSecureTextEntry = false
    }
    
}

extension UITextField {
  func setLeftView(image: UIImage) {
    let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 25, height: 25)) // set your Own size
    iconView.image = image
    let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
    self.tintColor = .black
  }
}


//MARK: @objc functions
extension SignupPageUI {
    
    // When Sign Up Button is pressed
    @objc func signupPressed(_ sender: UIButton) {
        print("Signup Page Clicked")
        
        // If fields do not contain text, output error message
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty,
              let username = usernameField.text, !username.isEmpty,
              let retypePass = retypeField.text, !retypePass.isEmpty else {
            print("Missing Data In The Fields")
            setErrorMessage(message: "Please Fill In The Required Fields")
            return
        }
        
        // Sign up user through firebase
        firebaseObj.handleSignup(email: email, password: password)
    }
    
    
    // When the Login Button is pressed go to login page
    @objc func loginPressed(_ sender: UIButton) {
        print("Login button pressed")
        let vc = LoginView()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
}


//MARK: Functions for UI Display
extension SignupPageUI {
    
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


//MARK: Functions to handle View Controller Transitioning
extension SignupPageUI {
    
    // Going from signup page to login page
    public func singupToLogin() {
        let vc = LoginView()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    
    // Going from signup page to the Tab Bar Pages
    func signupToMainScreen() {
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

//MARK: UITextField Delegates
extension SignupPageUI: UITextFieldDelegate {

    // This method is called when the return key is tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Dismiss the keyboard
        return true
    }
}

extension SignupPageUI {
    
    func addTapGestureRecongnition() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true) // Dismiss the keyboard
    }
}
