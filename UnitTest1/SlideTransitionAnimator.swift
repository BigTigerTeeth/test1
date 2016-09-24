//
//  SlideTransitionAnimator.swift
//  UnitTest1
//
//  Created by luckyxmobile on 16/9/23.
//  Copyright © 2016年 luckyxmobile. All rights reserved.
//

import UIKit

class SlideTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning{
    internal func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
        return 1.5;
    }
    
    internal func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewKey)
        let transformedStartFrame = toVC?.view.frame
        let origin = transformedStartFrame?.origin
        let width = transformedStartFrame?.width
        let height = transformedStartFrame?.height
        let transformedEndFrame = CGRectMake((origin?.x)! - 20, (origin?.y)!, width!, height!)
        transitionContext.containerView()?.addSubview((fromVC?.view)!)
        transitionContext.containerView()!.addSubview((toVC?.view)!)
        UIView.animateWithDuration(1.1, animations: {
            toVC?.view.frame = transformedEndFrame
            toVC?.view.alpha = 0.5
        }) { (finished) in
            toVC?.view.frame = transformedStartFrame!
            toVC?.view.alpha = 1.0
            transitionContext.completeTransition(true)
            
        }
    }
}
