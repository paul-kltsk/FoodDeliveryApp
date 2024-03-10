//
//  BottomView.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 29/02/2024.
//

import UIKit

class FDBottomView: UIView {
    
    //MARK: - Properties
    private let width = ScreenSize.width //414 in figma
    private let height = ScreenSize.height //896 in figma
    

    // MARK: - Views
    private let label = UILabel()
    private let lineView = UIView()
    private let mealImageView = UIImageView()
    private let facebookButton = UIButton()
    private let googleButton = UIButton()
    
    var facebookButtonAction: ( () -> Void )?
    var googleButtonAction: ( () -> Void )?
    
    
    // MARK: - Lifecycle
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   

}

private extension FDBottomView {
    func setupLayout(){
        backgroundColor = .white
        setupLineView()
        setupLabel()
        setupMealImageView()
        setupFacebookButton()
        setupGoogleButton()
    }

    
    func setupLineView() {
        self.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = AppColors.authBottomViewGray.withAlphaComponent(0.3)
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.widthAnchor.constraint(equalToConstant: width * 278 / 414),
            lineView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    func setupLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Or connect with"
        label.font = .Roboto.regular.size(of: 14)
        label.textColor = AppColors.authBottomViewGray
        label.textAlignment = .left
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: height * 16 / 896)
        ])
    }

    func setupMealImageView() {
        self.addSubview(mealImageView)
        mealImageView.image = UIImage(named: "meal")
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mealImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mealImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mealImageView.heightAnchor.constraint(equalToConstant: height * 123 / 896),
            mealImageView.widthAnchor.constraint(equalToConstant: width * 206 / 414)
        ])
        
    }
    
    func setupFacebookButton() {
        self.addSubview(facebookButton)
        facebookButton.setImage(UIImage(named: "facebook"), for: .normal)
        facebookButton.addTarget(self, action: #selector(facebookButtonTapped), for: .touchUpInside)
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            facebookButton.heightAnchor.constraint(equalToConstant: width * 40 / 414),
            facebookButton.widthAnchor.constraint(equalToConstant: width * 40 / 414),
            facebookButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: width * 284 / 414),
            facebookButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(height * 75 / 896))
        ])
    }
    
    func setupGoogleButton() {
        self.addSubview(googleButton)
        googleButton.setImage(UIImage(named: "google"), for: .normal)
        googleButton.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            googleButton.heightAnchor.constraint(equalToConstant: width * 40 / 414),
            googleButton.widthAnchor.constraint(equalToConstant: width * 40 / 414),
            googleButton.leadingAnchor.constraint(equalTo: facebookButton.trailingAnchor, constant: width * 20 / 414),
            googleButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(height * 75 / 896))
        ])
    }
}

// MARK: - button actions
private extension FDBottomView {
    
    @objc func facebookButtonTapped() {
        facebookButtonAction?()
    }
    
    @objc func googleButtonTapped() {
        googleButtonAction?()
    }
    
}
//
//#Preview("BottomView", traits: .fixedLayout(width: 300, height: 150)) {
//    BottomView()
//}
