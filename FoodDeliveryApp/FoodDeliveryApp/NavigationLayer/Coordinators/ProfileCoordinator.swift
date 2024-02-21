//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 21/02/2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .systemOrange
        navigationController?.pushViewController(vc, animated: false)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
 
}
