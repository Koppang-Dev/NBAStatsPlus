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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Function Calls
        configureTabs()
    }
    
    private func configureTabs() {
        // Setting the tab images
        vc1.tabBarItem.image = UIImage(systemName: "figure.basketball")
        vc2.tabBarItem.image = UIImage(systemName: "list.clipboard")
        
        // Setting title for each of the view controllers
        vc1.tabBarItem.title = "Games"
        vc2.tabBarItem.title = "Standings"
        
        tabBar.tintColor = .black
        
        // Setting the view controllers as UINavigationViewController
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        
        // Adding the view controllers in the NavigatioViewController
        setViewControllers([nav1, nav2], animated: false)
    }
}








