//
//  ViewController.swift
//  Paging_Swift
//
//  Created by Olga Dalton on 26/10/14.
//  Copyright (c) 2014 swiftiostutorials.com. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, UIPageViewControllerDataSource {
    
    // MARK: - Variables
    private var pageViewController: UIPageViewController?
    
    @IBOutlet weak var buttonScroll: UIScrollView!
    
    var controllers = [PageItemController]()
    
    // View controller for the popups.
    var popViewController: PopUpViewController!
    
    func timelineButtonPressed(sender:UIButton){
        
        // Launch a pop up
        // Could easily use the sender.tag to specify specific content.
        
        var message: String
        var image: UIImage
        
        switch(sender.tag) {
        case 1:
            message = "Booker T. Washington High School opens in September 1916. The school serves African American students, including Ward One children, from first grade to ninth grade.\n\nOlympia Mill Village is a company town located south of Ward One. Olympia School serves the children of textile workers. Before the passage of child labor laws, many of the students would have toiled in the mill rather than attend school.\n\nIn rural South Carolina, African American children often attend Rosenwald Schools. Philanthropist Julius Rosenwald, the president of Sears, Roebuck, and Company, provides funding for nearly 5,000 schools across the South, including over 450 in South Carolina."
            image = UIImage(named: "BTW_timeline_1")!
        case 2:
            message = "In September of 1970, Booker T Washington desegregates and see its first non-African American students. By the fall of 1971, the student body will be almost evenly split between black and white students. \n\nWhile Columbia officially began desegregation in August of 1964, the courts did not order the twenty-one school districts of South Carolina to integrate until September 1970. But the process is not peaceful: white and black students get into a large fight at A.C. Flora High School, with other racially-motivated altercations reported throughout the state. \n\nOn September 12th, 1970, the University of Southern California Trojans become to the first fully integrated football team to play the University of Alabama. The team crushes legendary coach Bear Bryant’s all-white Crimson Tide team, forever changing college athletics in the South."
            image = UIImage(named: "BTW_timeline_2")!

        case 3:
            message = "In 1974, Booker T. Washington High School, a center of education for young African Americans in Columbia, SC, closes due to public school desegregation in the state and the expansion of the University of South Carolina.\n\nA few years later, in 1979, Columbia’s City Planning Department applies for an Urban Development Action Grant under the federal government’s Urban Development Action Grants initiative, which ends urban renewal in the mid-70s. In its application, Columbia’s planning department places emphasis on the avoidance of discrimination and promotes public housing dispersal.\n\nIn 1974, The Housing and Community Redevelopment Act creates federal grant programs that focuses on improving blighted areas rather than demolishing them. This act reflects the developing negative attitude toward urban renewal policies that resulted from renewal’s high volume of residential displacement."
            image = UIImage(named: "BTW_timeline_3")!

        default:
            message = " "
            image = UIImage(named: "")!
        }
        
        if UIScreen.mainScreen().bounds.size.width > 320 {
            if UIScreen.mainScreen().scale == 3 {
                self.popViewController = PopUpViewController(nibName: "PopUpViewController_iPhone6Plus", bundle: nil)
                self.popViewController.title = "This is a popup view"
                self.popViewController.showInView(self.view, withImage: image, withMessage: message, animated: true)
            } else {
                self.popViewController = PopUpViewController(nibName: "PopUpViewController_iPhone6", bundle: nil)
                self.popViewController.title = "This is a popup view"
                self.popViewController.showInView(self.view, withImage: image, withMessage: message, animated: true)
            }
        } else {
            self.popViewController = PopUpViewController(nibName: "PopUpViewController", bundle: nil)
            self.popViewController.title = "This is a popup view"
            self.popViewController.showInView(self.view, withImage: image, withMessage: message, animated: true)
        }
    }
    
    func timelineButtonsView(buttonSize:CGSize, buttonCount:Int) -> UIView {
        
        // Creates a view for the buttons
        let buttonView = UIView()
        //buttonView.backgroundColor = UIColor.blackColor()
        buttonView.backgroundColor = UIColor(red:(212.0/255.0), green: (250.0/255.0), blue:(244.0/255.0), alpha: 1.0)
        buttonView.frame.origin = CGPointMake(0,0)
        let padding = CGSizeMake(20, 10)
        buttonView.frame.size.width = (buttonSize.width + padding.width) * CGFloat(buttonCount)
        buttonView.frame.size.height = (buttonSize.height +  2.0 * padding.height)
        
        if (buttonView.frame.size.width < self.view.frame.width) {
            buttonView.frame.size.width = self.view.frame.width + 10
        }
        
        // Defines some variables to have buttons at standard distances; Could easily be extended to create an actual timeline (i.e. distance between buttons can be different)
        var buttonPosition = CGPointMake(padding.width * 0.5, padding.height)
        let buttonIncrement = buttonSize.width + padding.width
      
        var dates: [String] = [" ", "1916", "1970", "1974", " ", " "]

        //let hueIncrement = 1.0 / CGFloat(buttonCount)
        //var newHue = hueIncrement
        
        // Begin Button adding code
        // Add Buttons to View - this just procedurally creates buttonCount many buttons with different colors
        for i in 0...(buttonCount - 1)  {
            var button = UIButton.buttonWithType(.Custom) as! UIButton
            button.tag = i
            button.frame.size = buttonSize
            button.frame.origin = buttonPosition
            buttonPosition.x = buttonPosition.x + buttonIncrement
            //button.backgroundColor = UIColor(hue: newHue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            //newHue = newHue + hueIncrement
            //button.backgroundColor = UIColor(red:(51.0/255.0), green: (51.0/255.0), blue:(51.0/255.0), alpha: 1.0)
            
            let image = UIImage(named: "button_image.png") as UIImage?
            button.setBackgroundImage(image, forState: UIControlState.Normal)
            button.setTitle(dates[i], forState: .Normal)
            
            if (dates[i] != " ") {
                button.addTarget(self, action: "timelineButtonPressed:", forControlEvents: .TouchUpInside)
            }
            buttonView.addSubview(button)
        }
        // End button adding code
        
        // Begin Line Code
        // Draw Timeline Line
        let line = UIView()
        line.setTranslatesAutoresizingMaskIntoConstraints(false)
        line.backgroundColor = UIColor(red:(51.0/255.0), green: (51.0/255.0), blue:(51.0/255.0), alpha: 1.0)
        line.frame = CGRect(origin: CGPoint(x: 0, y: 32.5), size: CGSize(width: buttonView.frame.width, height: 5))
      
        buttonView.addSubview(line) // Add the line to the screen
        buttonView.sendSubviewToBack(line) // Send it to the back
        // End Line Code
        
        return buttonView
    }
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateControllersArray()
        createPageViewController()
        setupPageControl()
        
        // Set the scrolling pageview
        let scrollingView = timelineButtonsView(CGSizeMake(50.0,50.0), buttonCount: 6) // This generates the buttons
        buttonScroll.contentSize = scrollingView.frame.size // Makes sure we actually scroll
        buttonScroll.addSubview(scrollingView) //Adds our stuff to the View
        buttonScroll.showsHorizontalScrollIndicator = true
        buttonScroll.indicatorStyle = .Default
        
        buttonScroll.contentOffset = CGPointMake((buttonScroll.contentSize.width / 2) - buttonScroll.frame.size.width, 0.0);
        
        view.bringSubviewToFront(buttonScroll)
    }
    
    func populateControllersArray() {
        for i in 0...4 {

            let controller = storyboard!.instantiateViewControllerWithIdentifier("ItemController\(i)") as! PageItemController
            controller.itemIndex = i
            controllers.append(controller)
            println(controller)
            
        }
    }
    
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageController") as! UIPageViewController
        pageController.dataSource = self
        
        if !controllers.isEmpty {
            pageController.setViewControllers([controllers[0]], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
            
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        pageViewController!.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 70);
        
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
        //
        //        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageController") as UIPageViewController
        //        pageController.dataSource = self
        //
        //        if contentImages.count > 0 {
        //            let firstController = getItemController(0)!
        //            let startingViewControllers: NSArray = [firstController]
        //            pageController.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        //        }
        //
        //        pageViewController = pageController
        //        addChildViewController(pageViewController!)
        //        self.view.addSubview(pageViewController!.view)
        //        pageViewController!.didMoveToParentViewController(self)
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor(red:(51.0/255.0), green: (51.0/255.0), blue:(51.0/255.0), alpha: 1.0)
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if let controller = viewController as? PageItemController {
            if controller.itemIndex > 0 {
                return controllers[controller.itemIndex - 1]
            }
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if let controller = viewController as? PageItemController {
            if controller.itemIndex < controllers.count - 1 {
                return controllers[controller.itemIndex + 1]
            }
        }
        
        return nil
    }
    
    
    // MARK: - Page Indicator
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
