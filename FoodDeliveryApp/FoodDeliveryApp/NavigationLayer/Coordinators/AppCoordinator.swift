//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 21/02/2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    override func start() {
        showOnboardingFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
 
}

//MARK: - Navigation methods
private extension AppCoordinator {
     
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        
    }
    
}

extension AppCoordinator: CoordinatorFinishDelegate {
    
    func coordinatorFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app: 
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
        
    }
}
