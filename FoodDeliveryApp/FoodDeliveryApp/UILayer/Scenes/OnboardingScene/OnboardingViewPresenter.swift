//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 22/02/2024.
//

import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    private let userStorage = UserStorage.shared
    
    //MARK: - properties
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        userStorage.passOnboarding = true
        coordinator.finish()
    }
}
