//
//  PageViews.swift
//  NBAStatsPlus
//
//  Created by Riley on 2024-03-02.
//

import Foundation
import UIKit


class PageViews: UIPageViewController {
    
    //MARK: Variable Initalization
    var pages = [UIViewController]() // Holds our onboarding pages
    let skipButton = UIButton()
    let nextButton = UIButton()
    let pageControl = UIPageControl(); // Initiates visual control to indicate the number of pages
    let initalPage = 0
    
   
    //MARK: Animation Layout Variables
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //MARK: Function Call
        setup()
        style()
        layout()
    }
}


// MARK: SETUP
extension PageViews {
    
    func setup() {
        
        dataSource = self
        delegate = self
        
        // Change page to the page indicator selected
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        
        //MARK: Pages Initalization
        let page1 = OnboardingView(imageName: "kyrie.jpeg",
                                             titleText: "Welcome to NBA Stats ",
                                             subtitleText: "Explore the world of basketball with real-time statistics, scores, and player insights. Your ultimate companion for staying updated on the NBA",
                                             viewColour: .systemYellow)
                                             
        let page2 = OnboardingView(imageName: "IT.jpeg",
                                             titleText: "Dive into the Game",
                                             subtitleText: "Immerse yourself in the excitement of NBA games. Get detailed player stats, team performance, and the latest highlights. Your front-row seat to the action!",
                                             viewColour: .systemGreen)
        let page3 = OnboardingView(imageName: "demar.png",
                                             titleText: "Your Stats, Your Way",
                                             subtitleText: "Customize your NBA experience. Follow your favorite teams and players, receive personalized notifications, and stay connected to the game like never before",
                                             viewColour: .systemRed)
        
        let page4 = LoginView(); // View Controller for the user to enter account information
        
        // Adding to the [UIViewController] array already defined
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        
        /*
         Passing in the very first view controller we want to display
         We are not passing them all in at this time
         */
        setViewControllers([pages[initalPage]], direction: .forward, animated: true, completion: nil)
    }
    
    //MARK: Style Function
    func style() {

        // Page Control UI
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initalPage
        
        //Skip Button UI Components
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.setTitleColor(.systemBlue, for: .normal)
        skipButton.setTitle("Skip", for: .normal)
        
        // Go to last page if skip button is tapped (Login Page)
        skipButton.addTarget(self, action: #selector(skipTapped(_:)), for: .primaryActionTriggered)
        
       // Next button
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.systemBlue, for: .normal)
        nextButton.addTarget(self, action: #selector(nextTapped(_:)), for: .primaryActionTriggered)
    }
    
    
    //MARK: Layout
    func layout() {
        
        // Adds UIPageControl instance to the view heirarchy
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        
        // Manually Setting Constraints
        NSLayoutConstraint.activate ([
            // Page Control
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 60),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Skip Button
            skipButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),

            // Next Button
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2),
            nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        ])
    }
}



//MARK: @OBJC functions
extension PageViews {
    
    // Function to handle if the pageControl is tapped
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
        animateControlsIfNeeded()
    }
    
    // Function to handle if the skip button is pressed
    @objc func skipTapped(_ sender: UIButton) {
        let lastPage = pages.count - 1
        pageControl.currentPage = lastPage
        goToSpecificPage(index: lastPage, ofViewControllers: pages)
        animateControlsIfNeeded()
    }
    
    // Function to handle if the next button is pressed
    @objc func nextTapped(_ sender: UIButton) {
        pageControl.currentPage += 1
        goToNextPage()
        animateControlsIfNeeded()
    }
}




// MARK: DataSources
    /*
     We extend and implement UIPageViewControllerDataSource
     Forces us to implement two functions: viewControllerBefore & viewControllerAfter
     These communicate what pages come before and next
     */
extension PageViews: UIPageViewControllerDataSource {
    
    /*
     First Required: viewControllerBefore
     Provide the view controller that comes before the specified view controller
     Return 'nil' if there is no view controller before the specified one
     */
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        /*
         Find the index of the specified view controller
         Or return nil
         */
        guard let currentIndex = pages.firstIndex(of: viewController) else {return nil}
        
        /*
         Returns the last element of the pages array
         If the first page is active, then going back will go to the last page
         */
        if (currentIndex == 0) {
            return pages.last
            
        } else {
            return pages[currentIndex - 1] // Goes to previous page
        }
    }
    

    /*
     Second Required: viewControllerAfter
     Provide the view controlle that comes after the specified view controller
     Return nil if there is no view controller after the specified one
     */
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // Getting the index of the current page
        // Goes and finds the viewcontroller currently being displayed
        guard let currentIndex = pages.firstIndex(of: viewController) else {return nil}
        
        /*
         Go to the next page
         If the next page is nil, then loop back to the beginning
         */
        if (currentIndex < pages.count - 1) {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
}

// MARK: Delegates
/*
 Handles page transition effects
 Page indicator updates
 Gestures and navigation
 Transition completion handling
 */
extension PageViews: UIPageViewControllerDelegate {
    
    /*
     Called after the animation of a page completes
     How we keep our pageControl in sync with viewControllers
     We use this to update our UI element PageControl (the page control indicators)
        - Since the transition to the next page is complete, the current page indicator also is updated
     */
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        /*
         Array of view controllers that are currently being displayed
         */
        guard let viewControllers = pageViewController.viewControllers else {return}
        
        /*
         Selecting viewControllers[0] because UIPageViewController typically displays one page
         Therefore we are selecting the current displayed page
         We then search in the array for the current page and save its index to a variable
         */
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else {return}
        
        
        // Setting the page indicator to the current page number
        pageControl.currentPage = currentIndex
        
        // Hides the control panel if necessary
        animateControlsIfNeeded()
    }
    
    // Either hides or shows the controls('Next' & 'Skip'
    func animateControlsIfNeeded() {
        
        // If the current page is the last page, lastPage = true, else lastPage = false
        let lastPage = pageControl.currentPage == pages.count - 1

        // Hide controls for the LoginPage
        if lastPage == true {
            hideControls()
        } else {
            showControls()
        }
        
        /*
         Animate changes made to a layout view
         */
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, // Animate duration
                                                       delay: 0, // Delay before starting
                                                       options: [.curveEaseOut], // Starts quick and slows
                                                       animations: {
                   self.view.layoutIfNeeded() // Code block containing the changes to animate
               }, completion: nil)
    }
    
    
    
    private func hideControls() {
        pageControl.isHidden = true
        skipButton.isHidden = true
        nextButton.isHidden = true
    }
    
    private func showControls() {
        pageControl.isHidden = false
        skipButton.isHidden = false
        nextButton.isHidden = false
    }
    
    
}


// Adding additional functionality without changing the original source code
extension UIPageViewController {
    
    /*
     Animated parameter is provided a default value of true
     External parameter completion of type Bool->Void is provided a default value of nil
     */
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        
        // Gets the current page
        guard let currentPage = viewControllers?[0] else {return}
        
        // Gets the next page using the data source
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else {return}
        
        // Sets the next page as the visable page
        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    // Going to the previous onboarding page
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        
        // Gets the current page
        guard let currentPage = viewControllers?[0] else {return}
        
        // Gets the next page using the data source
        guard let previousPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else {return}
        
        setViewControllers([previousPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToSpecificPage(index: Int, ofViewControllers pages: [UIViewController]) {
        setViewControllers([pages[index]], direction: .forward, animated: true)
    }
}
