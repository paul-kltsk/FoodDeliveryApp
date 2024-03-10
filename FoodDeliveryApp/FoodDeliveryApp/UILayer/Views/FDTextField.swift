//
//  FDTextField.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 10/03/2024.
//

import UIKit

class FDTextField: UITextField {

    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.layer.cornerRadius = 20
        self.backgroundColor = AppColors.gray
        self.placeholder = "Text to input"
        self.font = .Roboto.regular.size(of: 16)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
