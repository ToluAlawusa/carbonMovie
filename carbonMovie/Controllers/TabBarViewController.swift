//
//  TabBArViewController.swift
//  carbonMovie
//
//  Created by Tolu Alawusa on 5/26/21.
//

import UIKit

class TabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeScreenVC = UINavigationController(rootViewController: MovieListViewController())
        let favVC = UINavigationController(rootViewController: FavouritesViewController())
       
        let item1 = UITabBarItem()
        item1.title = "Home"
        item1.image = UIImage(systemName: "house.fill")
        
        let item2 = UITabBarItem()
        item2.title = "Favourites"
        item2.image = UIImage(systemName: "film.fill")
        
        homeScreenVC.tabBarItem = item1
        favVC.tabBarItem = item2
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([homeScreenVC, favVC], animated: false)
        
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.edgesForExtendedLayout = .top
        present(tabBarController, animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.navigationBar.barTintColor = .blue
        self.navigationController?.isNavigationBarHidden = true
//        self.tabBarController?.tabBar.barTintColor = UIColor.black
        
        self.addKeyboardObserver()
        
    }

}

