//
//  UserStorage.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 25/02/2024.
//

import Foundation

class UserStorage {
    
    static let shared = UserStorage()
    
    var passOnboarding: Bool {
        get{ UserDefaults.standard.bool(forKey: "passOnboarding")}
        set{ UserDefaults.standard.set(newValue, forKey: "passOnboarding")}
    }
    
}
