//
//  OnboardingViewController.swift
//  FoodDeliveryApp
//
//  Created by Pavel Kylitsky on 22/02/2024.
//

import UIKit

//MARK: - OnboardingViewController
class OnboardingViewController: UIViewController {

    //MARK: - Properties
    private var pages = [OnboardingPartViewController]()
    private var currentPageIndex = 0
    
    //MARK: - Views
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    private let bottomButton = FDButton()
    var viewOutput: OnboardingViewOutput!
     
    init(pages: [OnboardingPartViewController] = [OnboardingPartViewController]() , viewOutput: OnboardingViewOutput!) {
        super.init(nibName: nil, bundle: nil)
        self.viewOutput = viewOutput
        self.pages = pages
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = AppColors.accentOrange
        setupPageViewController()
        setupPageControl()
        setupBottomButton()
    }
    


}

//MARK: - Actions
private extension OnboardingViewController {
    @objc func buttonPressed() {
        switch pageControl.currentPage {
            case 0:
                pageControl.currentPage = 1
                pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true)
            case 1:
                pageControl.currentPage = 2
                pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true)
            case 2:
                pageControl.currentPage = 3
                pageViewController.setViewControllers([pages[3]], direction: .forward, animated: true)
                bottomButton.setTitle(title: "Cool!")
            case 3:
                print("Exit")
                viewOutput.onboardingFinish()
            default: break
        }
    }
}

//MARK: - Layout
private extension OnboardingViewController {
    
    func setupBottomButton() {
        view.addSubview(bottomButton)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.setTitle(title: "Next")
        bottomButton.action = buttonPressed
        bottomButton.schemes = .gray
        
        NSLayoutConstraint.activate([
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButton.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: -50),
            bottomButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        pageViewController.isDoubleSided = false
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
}

//MARK: - UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex > 0 else { return nil }
        
        return pages[currentIndex - 1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex < pages.count - 1 else { return nil }
        
        return pages[currentIndex + 1]
        
    }
    
}

//MARK: - UIPageViewControllerDelegate delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnboardingPartViewController) {
            currentPageIndex = index
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            pageControl.currentPage = currentPageIndex
            currentPageIndex == 3 ? bottomButton.setTitle(title:"Cool!") : bottomButton.setTitle(title:"Next")
        }
    }
    
}
 