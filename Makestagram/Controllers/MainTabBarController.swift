//
//  MainTabBarController.swift
//  Makestagram
//
//  Created by Brian Sakhuja on 6/27/17.
//  Copyright © 2017 Brian Sakhuja. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self as? UITabBarControllerDelegate // delegate = self
        
        tabBar.unselectedItemTintColor = .black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainTabBarController {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    
    
}




