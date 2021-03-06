//
//  PopUpViewController
//  TimelineTest
//
//  Created by Connor Bain on 4/9/15.
//  Copyright (c) 2015 Connor Bain. All rights reserved.
//

import UIKit
import QuartzCore

@objc class PopUpViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var messageBox: UITextView!
    @IBOutlet weak var imageBox: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        self.popUpView.layer.cornerRadius = 5
        self.popUpView.layer.shadowOpacity = 0.8
        self.popUpView.layer.shadowOffset = CGSizeMake(0.0, 0.0)
    }
    
    func showInView(aView: UIView!, withImage image: UIImage!, withMessage message: String!, animated: Bool) {
        aView.addSubview(self.view)
        messageBox!.text = message
        messageBox!.font = UIFont(name: "HelveticaNeue-Light", size: 18)

        imageBox!.image = image
        //messageLabel!.text = message
        if animated {
            self.showAnimate()
        }
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.view.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
        });
    }
    
    func removeAnimate() {
        UIView.animateWithDuration(0.25, animations: {
            self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.view.removeFromSuperview()
                }
        });
    }
    
    // This is linked to the .xib close button via the IBAction
    @IBAction func closePopup(sender: AnyObject) {
        self.removeAnimate()
    }
}