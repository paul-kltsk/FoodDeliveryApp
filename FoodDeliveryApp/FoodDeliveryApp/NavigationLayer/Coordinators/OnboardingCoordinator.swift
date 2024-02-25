//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 21/02/2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    
    //MARK: - Methods
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("OnboardingCoordinator finish")
        finishDelegate?.coordinatorFinish(childCoordinator: self)
    }
 
}

private extension OnboardingCoordinator {
    
    func showOnboarding() {
        let viewController = factory.makeOnboardingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
