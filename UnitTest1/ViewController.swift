//
//  ViewController.swift
//  UnitTest1
//
//  Created by luckyxmobile on 16/9/22.
//  Copyright © 2016年 luckyxmobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var upButton: UIButton!
    
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var downButton: UIButton!
    
    @IBOutlet weak var box1: UIView!
    @IBOutlet weak var box: UIView!
    var animator: UIDynamicAnimator!

    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    var animator1: UIDynamicAnimator!
    var gravity1: UIGravityBehavior!
    var collision1: UICollisionBehavior!
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let boxEffectX = UIInterpolatingMotionEffect.init(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        boxEffectX.maximumRelativeValue = 50
        boxEffectX.minimumRelativeValue = -50
        self.box.addMotionEffect(boxEffectX)
        
//        self.animator = UIDynamicAnimator.init(referenceView: self.view)
//        self.gravity = UIGravityBehavior.init(items: [self.box])
//        let gravityDirection: CGVector = CGVectorMake(0.0, 0.1)
//        self.gravity.gravityDirection = gravityDirection
//        self.animator.addBehavior(self.gravity)
//        
//        self.collision = UICollisionBehavior.init(items: [self.box])
//        self.collision.translatesReferenceBoundsIntoBoundary = true
//        self.animator.addBehavior(self.collision)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        box.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        upButton.addTarget(self, action: #selector(moveToUp), forControlEvents: .TouchDown)
        downButton.addTarget(self, action: #selector(moveToDown), forControlEvents: .TouchDown)
        leftButton.addTarget(self, action: #selector(moveToLeft), forControlEvents: .TouchDown)
        rightButton.addTarget(self, action: #selector(moveToRight), forControlEvents: .TouchDown)
    }

    private func setOffscreenPosition() {
        var center = view.center
        center.y = -(CGRectGetHeight(box1.frame) / 2.0)
        box1.center = center
        animator1.removeAllBehaviors()
    }
    
    @IBAction func letDropDown(sender: AnyObject) {
                dropDown()
                self.animator1.addBehavior(self.gravity1)
                self.animator1.addBehavior(self.collision1)
    }

    func  dropDown(){
        self.animator1 = UIDynamicAnimator.init(referenceView: self.view)
        self.gravity1 = UIGravityBehavior.init(items: [self.box1])
        let gravityDirection: CGVector = CGVectorMake(0.0, 0.1)
        self.gravity1.gravityDirection = gravityDirection
        
        self.collision1 = UICollisionBehavior.init(items: [self.box1])
        self.collision1.translatesReferenceBoundsIntoBoundary = true
        let boundaryInsets = UIEdgeInsets(top: -200.0, left: -20.0, bottom: 255, right: 20.0)
        collision1.setTranslatesReferenceBoundsIntoBoundaryWithInsets(boundaryInsets)
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "tranistionModal"{
//            let destinationViewController = segue.destinationViewController as UIViewController
//            destinationViewController.transitioningDelegate = self
//        }
//    }
    
//    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
//        let animate = SlideTransitionAnimator()
//        return animate
//    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        let animate = SlideTransitionAnimator()
        return animate
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        let animate = SlideTransitionAnimator()
        return animate
    }
    
    func moveToUp(){
        UIView.animateWithDuration(2.5) {
            var position = self.box.frame
            position.origin.y -= 20
            self.box.frame = position
        }
    }
    
    func moveToDown(){
        UIView.animateWithDuration(3, animations: { 
            var position = self.box.frame
            position.origin.y += 20
            self.box.frame = position
            self.downButton.alpha = 0
            }){ (finish) in
            self.downButton.alpha = 1
        }

    }
    
    func moveToLeft(){
        UIView.transitionWithView(self.box, duration: 3.0, options: .TransitionFlipFromLeft, animations: {
            var position = self.box.frame
            position.origin.x -= 20
            self.box.frame = position
            }) { (finfish) in
            print("ending move to left!")
        }
  
    }
    
    func moveToRight(){
        var position = box.frame
        position.origin.x += 20
        box.frame = position
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

