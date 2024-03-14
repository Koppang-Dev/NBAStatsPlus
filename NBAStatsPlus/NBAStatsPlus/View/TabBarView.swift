//
//  TabBarView.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-06.
//


import Foundation
import UIKit


// Making it of type TabBar
class TabBarView: UITabBarController {
    
    //MARK: Properties
    let vc1 = GameListView()
    let vc2 = StandingView()
    let vc3 = ReelsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabBarController = self.tabBarController {
                  tabBarController.delegate = self
              }
        
        //MARK: Function Calls
        configureTabs()
    }
    
    private func configureTabs() {
        // Setting the tab images
        vc1.tabBarItem.image = UIImage(systemName: "figure.basketball")
        vc2.tabBarItem.image = UIImage(systemName: "list.clipboard")
        vc3.tabBarItem.image = UIImage(systemName: "play.fill")
        
        // Setting title for each of the view controllers
        vc1.tabBarItem.title = "Games"
        vc2.tabBarItem.title = "Standings"
        vc3.tabBarItem.title = "Reels"
        
        tabBar.tintColor = .black
        
        // Adding the view controllers in the NavigatioViewController
        setViewControllers([vc1, vc2, vc3], animated: false)
    }
}


// Handling when the tab is changed
extension TabBarView: UITabBarControllerDelegate {
    // Dectect when a tab changes
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if let previousViewController = tabBarController.selectedViewController,
           previousViewController is ReelsView {
            // If user is leaving Reels View (Pause video)
            print("Leaving from Reels View")
        }
    }
}








