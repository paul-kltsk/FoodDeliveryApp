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
        var pages = [OnboardingPartViewController]()
        let firstVC = OnboardingPartViewController()
        firstVC.image = UIImage(resource: .chikenleg)
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        
        let secondVC = OnboardingPartViewController()
        secondVC.image = UIImage(resource: .shipped)
        secondVC.titleText = "Fast Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.image = UIImage(resource: .medal)
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        
        let fourthVC = OnboardingPartViewController()
        fourthVC.image = UIImage(resource: .creditcard)
        fourthVC.titleText = "Payment Online"
        fourthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
