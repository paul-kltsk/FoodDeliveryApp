//
//  OrderCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 21/02/2024.
//

import UIKit

class OrderCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .green
        navigationController?.pushViewController(vc, animated: false)
    }
    
    override func finish() {
        print("OrderCoordinator finish")
    }
 
}
