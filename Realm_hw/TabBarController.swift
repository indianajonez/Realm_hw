//
//  TabBarController.swift
//  Realm_hw
//
//  Created by Ekaterina Saveleva on 12.08.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    private let networking = NetworkService()
    private lazy var viewFirst = ViewController(networkService: networking)
    private lazy var viewSecond = TableJokeViewController()
    private lazy var viewThird = CategoriesTableViewController(networkService: networking)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
        view.backgroundColor = .systemGray
    }
    
    private func setupTabBar() {
        let firstNavigation = UINavigationController(rootViewController: viewFirst)
        let secondNavigation =  UINavigationController(rootViewController: viewSecond)
        let thirdNavigation = UINavigationController(rootViewController: viewThird)
        
        // список кнопок таббара
        viewControllers = [firstNavigation, secondNavigation, thirdNavigation]
        
        firstNavigation.tabBarItem = UITabBarItem(title: "Шутки про Чака", image: UIImage(systemName: "pencil.line"), tag: 0)
        secondNavigation.tabBarItem = UITabBarItem(title: "Список шуток", image: UIImage(systemName: "doc.richtext"), tag: 1)
        thirdNavigation.tabBarItem = UITabBarItem(title: "Категории", image: UIImage(systemName: "tray.2"), tag: 2)
    }
    

}
