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
    
    var viewOutput: LoginViewOutput!
    
    // MARK: - Views
    private let bottomView = FDBottomView()
    private lazy var titleLabel = UILabel()
    private lazy var signInUsername = FDTextField()
    private lazy var signInPassword = FDTextField()
    private lazy var signUpUsername = FDTextField()
    private lazy var signUpPassword = FDTextField()
    private lazy var signUpReEnterPass = FDTextField()
    private lazy var forgotLabel = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    private lazy var verticalStack = UIStackView()
    
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
        case .signin:
            setupBottomView()
            setupStack()
            setupSignInPassword()
            setupSignInUsername()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
        case .signup:
            setupBottomView()
            setupStack()
            setupSignUpPassword()
            setupSignUpRePassword()
            setupSignUpUsername()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
        }
    }
    
    //MARK: - UI setup methods
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(of: 24)
        titleLabel.textAlignment = .left
        switch state {
        case .initial:
            break
        case .signin:
            titleLabel.text = "Sign in"
            NSLayoutConstraint.activate([
                titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                titleLabel.heightAnchor.constraint(equalToConstant: 28)
            ])
        case .signup:
            titleLabel.text = "Sign up"
            NSLayoutConstraint.activate([
                titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                titleLabel.heightAnchor.constraint(equalToConstant: 28)
            ])
        }

    }
    func setupSignInPassword() {
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        signInPassword.placeholder = "Enter Password"
        NSLayoutConstraint.activate([
            signInPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignInUsername() {
        signInUsername.translatesAutoresizingMaskIntoConstraints = false
        signInUsername.placeholder = "Enter Username"
        NSLayoutConstraint.activate([
            signInUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInUsername.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInUsername.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func setupForgotLabel() {
        view.addSubview(forgotLabel)
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.text = "Forgot password?"
        forgotLabel.textColor = AppColors.bottomViewGray
        forgotLabel.font = .Roboto.regular.size(of: 14)
        NSLayoutConstraint.activate([
            forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            forgotLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    func setupLogoImage() {
        view.addSubview(logoImage)
        logoImage.image = UIImage(resource: .loginLogo)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            logoImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 57),
            logoImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor)
        ])
        
    }
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.schemes = .orange
        signInButton.setTitle(title: "Sign In")
        signInButton.action = onSignInTapped
        
        switch state {
        case .initial:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
                signInButton.heightAnchor.constraint(equalToConstant: 50),
                signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
        case .signin:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.heightAnchor.constraint(equalToConstant: 50),
                signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
        case .signup:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.heightAnchor.constraint(equalToConstant: 50),
                signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
        }
        
    }
    func setupSignUpPassword() {
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter Password"
        NSLayoutConstraint.activate([
            signUpPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpRePassword() {
        signUpReEnterPass.translatesAutoresizingMaskIntoConstraints = false
        signUpReEnterPass.placeholder = "Re-enter Password"
        NSLayoutConstraint.activate([
            signUpReEnterPass.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpReEnterPass.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpReEnterPass.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpUsername() {
        signUpUsername.translatesAutoresizingMaskIntoConstraints = false
        signUpUsername.placeholder = "Enter Username"
        NSLayoutConstraint.activate([
            signUpUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpUsername.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpUsername.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.schemes = .gray
        signUpButton.setTitle(title: "Sign Up")
        signUpButton.action = onSignUpTapped
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
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
    func setupStack() {
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        
        switch state {
        case .initial:
            break
        case .signin:
            verticalStack.addArrangedSubview(signInUsername)
            verticalStack.addArrangedSubview(signInPassword)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -265)
            ])
        case .signup:
            verticalStack.addArrangedSubview(signUpUsername)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpReEnterPass)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -227)
            ])
        }
    }
}

//MARK: - LoginViewInput protocol methods
extension LoginViewController: LoginViewInput {
    
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignIn()
        case .signin:
            return
        case .signup:
            return
        }
    }
    
    func onSignUpTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignUp()
        case .signin:
            return
        case .signup:
            return
        }
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
}

