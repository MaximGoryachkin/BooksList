//
//  TabBarViewController.swift
//  BooksList
//
//  Created by Максим Горячкин on 06.05.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let booksListVC = UIViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.backgroundColor = UIColor(red: 243/255, green: 242/255, blue: 247/255, alpha: 0.8)
        tabBar.tintColor = .orange
        setupControllers()
    }
    
    private func setupControllers() {
        booksListVC.view.backgroundColor = .purple
        viewControllers = [
            createNavController(for: BooksListViewController(),
                                title: "Want",
                                image: UIImage(systemName: "questionmark.circle")!),
            createNavController(for: booksListVC,
                                title: "Read",
                                image: UIImage(systemName: "checkmark.circle.fill")!)
        ]
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                     title: String,
                                     image: UIImage) -> UIViewController {
            let navigationController = UINavigationController(rootViewController: rootViewController)
            navigationController.tabBarItem.title = title
            navigationController.tabBarItem.image = image
            navigationController.navigationBar.prefersLargeTitles = true
            rootViewController.navigationItem.title = title
            return navigationController
    }

}

extension TabBarViewController: UITabBarControllerDelegate  {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
          return false // Make sure you want this as false
        }

        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionFlipFromBottom], completion: nil)
        }

        return true
    }
}
