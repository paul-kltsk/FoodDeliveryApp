//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 21/02/2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
        showOnboardingFlow()
//        userStorage.passOnboarding ? showMainFlow() : showOnboardingFlow()

    }
    
    override func finish() {
        print("AppCoordinator finish")
        finishDelegate?.coordinatorFinish(childCoordinator: self)
    }
 
}

//MARK: - Navigation methods
private extension AppCoordinator {
     
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        factory.makeOnboardingFlow(finishDelegate: self, navigationController: navigationController, coordinator: self)
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(finishDelegate: self,coordinator: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
}

extension AppCoordinator: CoordinatorFinishDelegate {
    
    func coordinatorFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
        
    }
}
