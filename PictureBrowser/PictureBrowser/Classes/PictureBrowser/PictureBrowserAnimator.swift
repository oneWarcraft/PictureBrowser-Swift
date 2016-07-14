//
//  PictureBrowserAnimator.swift
//  PictureBrowser
//
//  Created by 王继伟 on 16/7/14.
//  Copyright © 2016年 WangJiwei. All rights reserved.
//

import UIKit

class PictureBrowserAnimator: NSObject {
    var isPresented : Bool = false
}


// MARK: 实现pictureBrowser的转场代理方法
extension PictureBrowserAnimator : UIViewControllerTransitioningDelegate {
    // 告诉弹出的动画交给谁去处理
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = true
        
        return self
    }
    
    // 告诉消失的动画交给谁去处理
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = false
        
        return self
    }
}

extension PictureBrowserAnimator : UIViewControllerAnimatedTransitioning {
    // 1.决定动画执行的时间
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 2.0
    }
    
    // 2.决定动画如何实现
    // transitionContext : 可以通过转场上下文去获取弹出的View和即将消失的View
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        if isPresented {
            // 1.获取弹出的View
            let presentedView = transitionContext.viewForKey(UITransitionContextToViewKey)!
            
            // 2.将弹出的View添加到containerView中
            transitionContext.containerView()?.addSubview(presentedView)
            
            // 3.执行动画
            presentedView.alpha = 0.0
            let duration = transitionDuration(transitionContext)
            UIView.animateWithDuration(duration, animations: { () -> Void in
                presentedView.alpha = 1.0
            }) {
                (_) -> Void in
                transitionContext.completeTransition(true)
            }
            
        }else
        {
            // 1.取出消失的View
            let dismissView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            
            // 2.执行动画
            let duration = transitionDuration(transitionContext)
            UIView.animateWithDuration(duration, animations: {
                () -> Void in
                dismissView?.alpha = 0.0
                }, completion: { (_) -> Void in
                    dismissView?.removeFromSuperview()
                    transitionContext.completeTransition(true)
            })
            
            
        }
        
    }
}








