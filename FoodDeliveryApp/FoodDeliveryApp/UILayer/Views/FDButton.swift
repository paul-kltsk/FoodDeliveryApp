//
//  FBButton.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 10/03/2024.
//

import UIKit

enum FDButtonColorSchemes {
    case white 
    case orange
    case gray
}

class FDButton: UIView {
    
    private let button = UIButton()
    
    var action: (() -> Void)?
    
    var schemes: FDButtonColorSchemes = .white {
        didSet {
            setColorScheme(scheme: schemes)
        }
    }
    
    
    // MARK: - Lifecycle
    init(scheme: FDButtonColorSchemes = .white) {
        super.init(frame: .zero)
        self.schemes = scheme
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .clear
        setupbutton()
    }
    
    private func setupbutton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .Roboto.bold.size(of: 18)
        button.setTitle("Next", for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    @objc private func buttonPressed() {
        guard let action = action else { return }
        action()
    }
    
    private func setColorScheme(scheme: FDButtonColorSchemes) {
        switch scheme {
        case .white:
            button.backgroundColor = AppColors.white
            button.setTitleColor(AppColors.accentOrange, for: .normal)
        case .orange:
            button.backgroundColor = AppColors.accentOrange
            button.setTitleColor(AppColors.white, for: .normal)
        case .gray:
            button.backgroundColor = AppColors.gray
            button.setTitleColor(AppColors.black, for: .normal)
        }
    }
    
    public func setTitle(title: String) {
        button.setTitle(title, for: .normal)
    }

}
