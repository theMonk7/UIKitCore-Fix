
//
//  UINavigation+CustomNavigationExtension.swift
//  orion-ios
//
//  Created by Utkarsh Raj on 10/03/23.
//

import Foundation
import UIKit

enum NavigationActions {
    case pushViewController
    case popViewController
    case popToRootViewController
}

extension UINavigationController {
    public func pushViewController(_ vc: UIViewController, shouldAnimate: Bool) {
        SerialEventQueueManager.shared.addNavigationOperation(operation: (actionType: .pushViewController, navController: self, vc: vc, animated: shouldAnimate))
    }
    
    public func popViewController(shouldAnimate: Bool) {
        SerialEventQueueManager.shared.addNavigationOperation(operation: (actionType: .popViewController, navController: self, vc: nil, animated: shouldAnimate))
    }
    
    public func popToRootViewController(shouldAnimate: Bool) {
        SerialEventQueueManager.shared.addNavigationOperation(operation: (actionType: .popToRootViewController, navController: self, vc: nil, animated: shouldAnimate))
    }
    
    
    public func pushHandler(_ vc: UIViewController, navController: UINavigationController?, shouldAnimate: Bool) {
        guard let navController = navController else {
            return
        }
        CATransaction.begin()
        
        CATransaction.setCompletionBlock(self.navigationCompletionHandler)
        let transition = CATransition()
        transition.duration = shouldAnimate ? 0.35 : 0.1
        transition.startProgress = shouldAnimate ? 0 : 1
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        navController.view.window?.layer.add(transition, forKey: kCATransition)
        DispatchQueue.main.async {
            navController.pushViewController(vc, animated: shouldAnimate)
        }
        
        CATransaction.commit()
    }
    
    public func popHandler(navController: UINavigationController?, shouldAnimate: Bool) {
        guard let navController = navController else {
            return
        }
        CATransaction.begin()
        
        CATransaction.setCompletionBlock(self.navigationCompletionHandler)
        if self.viewControllers.count > 1 {
            let transition = CATransition()
            transition.duration = shouldAnimate ? 0.35 : 0.1
            transition.startProgress = shouldAnimate ? 0 : 1
            transition.type = CATransitionType.push
            transition.subtype = .fromLeft
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            navController.view.window?.layer.add(transition, forKey: kCATransition)
        }
        DispatchQueue.main.async {
            navController.popViewController(animated: shouldAnimate)
        }
        
        
        CATransaction.commit()
    }
    
    public func popToRootHandler(navController: UINavigationController?, shouldAnimate: Bool) {
        guard let navController = navController else {
            return
        }

        CATransaction.begin()
        
        CATransaction.setCompletionBlock(self.navigationCompletionHandler)
        if self.viewControllers.count > 1 {
            let transition = CATransition()
            transition.duration = shouldAnimate ? 0.35 : 0.1
            transition.startProgress = shouldAnimate ? 0 : 1
            transition.type = CATransitionType.push
            transition.subtype = .fromLeft
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            navController.view.window?.layer.add(transition, forKey: kCATransition)
        }
        DispatchQueue.main.async {
            navController.popToRootViewController(animated: shouldAnimate)
        }
                  
        CATransaction.commit()
    }
    
    private func navigationCompletionHandler() {
        SerialEventQueueManager.shared.processDoneCallback()
    }
    
}
