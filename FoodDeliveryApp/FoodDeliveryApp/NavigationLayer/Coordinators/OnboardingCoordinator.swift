//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 21/02/2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
 
}


