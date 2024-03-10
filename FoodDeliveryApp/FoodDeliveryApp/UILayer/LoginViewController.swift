//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 29/02/2024.
//

import UIKit

enum LoginViewState {
    case initial
    case signin
    case signup
}

protocol LoginViewInput: AnyObject {
    func onSignInTapped()
    func onSignUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
    func onBackPressed()
}

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private let width = ScreenSize.width //414 in figma
    private let height = ScreenSize.height //896 in figma
    
    private var state: LoginViewState = .initial
    
    weak var viewOutput: LoginViewOutput!
    
    // MARK: - Views
    private let bottomView = FDBottomView()
    private lazy var textField = FDTextField()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    
    // MARK: - Initializers
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLayout()
        
        bottomView.googleButtonAction = googleButtonPressed
        bottomView.facebookButtonAction = facebookButtonPressed
        
    }
    
    func googleButtonPressed() {
        print("Google")
    }
    
    func facebookButtonPressed() {
        print("Facebook")
    }
    
}

//MARK: - Layout
private extension LoginViewController {

    func setupLayout() {
        
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .signup:
            setupBottomView()
            setupTextField()
        case .signin:
            setupBottomView()
            setupTextField()
        }
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: height * 151 / 896)
        ])
    }
    
    func setupTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 354)
        ])
    }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        logoImage.image = UIImage(resource: .appstore)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 300),
            logoImage.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.schemes = .orange
        signInButton.setTitle(title: "Sign In")
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
            signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.widthAnchor.constraint(equalToConstant: 354)
        ])
    }
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.schemes = .gray
        signUpButton.setTitle(title: "Sign Up ")
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.widthAnchor.constraint(equalToConstant: 354)
        ])
    }
}

extension LoginViewController: LoginViewInput {
    
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        
    }
    
    func onSignUpTapped() {
        
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
}
