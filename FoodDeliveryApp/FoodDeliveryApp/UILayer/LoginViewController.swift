//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 29/02/2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private let width = ScreenSize.width //414 in figma
    private let height = ScreenSize.height //896 in figma
    
    // MARK: - Views
    var bottomView = BottomView()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
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
        setupBottomView()
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
}
