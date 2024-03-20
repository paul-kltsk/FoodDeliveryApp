//
//  LoginViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 10/03/2024.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStart()
    func registrationStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPassword()
    func back()
}

class LoginPresenter {
    
    private var coordinator: AppCoordinator!
    weak var viewInput: LoginViewInput?
    
    init(coordinator: AppCoordinator!, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
    
}

extension LoginPresenter: LoginViewOutput {
    
    func loginStart() {
        
    }
    
    func registrationStart() {
        
    }
    
    func goToFacebookLogin() {
        
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        coordinator.showSignInScene()
    }
    
    func goToSignUp() {
        coordinator.showSignUpScene()
    }
    
    func goToForgotPassword() {
        
    }
    
    func back() {
        
    }
    
}
