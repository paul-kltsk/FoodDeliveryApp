//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 21/02/2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("OnboardingCoordinator finish")
    }
 
}

private extension OnboardingCoordinator {
    
    func showOnboarding() {
        var pages = [UIViewController]()
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .systemGreen
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .systemYellow
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .systemPink
        pages.append(vc1)
        pages.append(vc2)
        pages.append(vc3)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
