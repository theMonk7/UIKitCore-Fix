//
//  UINavigation+NativeNavigationQueueManagerExtension.swift
//
//  Created by Utkarsh Raj on 10/03/23.
//

import Foundation
import Collections
import UIKit

enum NavigationActions {
    case pushViewController
    case popViewController
    case popToRootViewController
}

extension UINavigationController {
    public func pushViewController(_ vc: UIViewController, shouldAnimate: Bool) {
        NativeNavigationQueueManager.shared.addNavigationOperation(operation: (actionType: .pushViewController, navController: self, vc: vc, animated: shouldAnimate))
    }
    
    public func popViewController(shouldAnimate: Bool) {
        NativeNavigationQueueManager.shared.addNavigationOperation(operation: (actionType: .popViewController, navController: self, vc: nil, animated: shouldAnimate))
    }
    
    public func popToRootViewController(shouldAnimate: Bool) {
        NativeNavigationQueueManager.shared.addNavigationOperation(operation: (actionType: .popToRootViewController, navController: self, vc: nil, animated: shouldAnimate))
    }
    
    
    fileprivate func pushHandler(_ vc: UIViewController, shouldAnimate: Bool) {
        CATransaction.begin()
        
        CATransaction.setCompletionBlock(self.navigationCompletionHandler1)
        let transition = CATransition()
        transition.duration = shouldAnimate ? 0.35 : 0.1
        transition.startProgress = shouldAnimate ? 0 : 1
        transition.type = CATransitionType.push
        transition.subtype = .fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window?.layer.add(transition, forKey: kCATransition)
        DispatchQueue.main.async {
            self.pushViewController(vc, animated: shouldAnimate)
        }
        
        CATransaction.commit()
    }
    
    fileprivate func popHandler(shouldAnimate: Bool) {
        CATransaction.begin()
        
        CATransaction.setCompletionBlock(self.navigationCompletionHandler1)
        let transition = CATransition()
        transition.duration = shouldAnimate ? 0.35 : 0.1
        transition.startProgress = shouldAnimate ? 0 : 1
        transition.type = CATransitionType.push
        transition.subtype = .fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window?.layer.add(transition, forKey: kCATransition)
        DispatchQueue.main.async {
            self.popViewController(animated: shouldAnimate)
        }
        
        
        CATransaction.commit()
    }
    
    fileprivate func popToRootHandler(shouldAnimate: Bool) {
        CATransaction.begin()
        
        CATransaction.setCompletionBlock(self.navigationCompletionHandler1)
        let transition = CATransition()
        transition.duration = shouldAnimate ? 0.35 : 0.1
        transition.startProgress = shouldAnimate ? 0 : 1
        transition.type = CATransitionType.push
        transition.subtype = .fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window?.layer.add(transition, forKey: kCATransition)
        DispatchQueue.main.async {
            self.popToRootViewController(animated: shouldAnimate)
        }
                  
        CATransaction.commit()
    }
    
    
    // RENAME the completion handler
    private func navigationCompletionHandler1() {
        NativeNavigationQueueManager.shared.processDoneCallback()
    }
    
}

class NativeNavigationQueueManager {
    private var operationQueue: Deque<(actionType:NavigationActions, navController: UINavigationController, vc: UIViewController?, animated: Bool)> = []
    private var isProcessing = false
    
    static let shared: NativeNavigationQueueManager = {
        print("UO")
        return NativeNavigationQueueManager()
    }()
    
    private init() {}
    
    private func alterProcessingState(isProcessing: Bool) {
        self.isProcessing = isProcessing
    }
    
    private func processOperationQueue() {
        if self.isProcessing {
            return
        }
        guard self.operationQueue.count > 0, let operation =  self.operationQueue.popFirst() else {
            return
        }
        self.alterProcessingState(isProcessing: true)
        switch operation.actionType {
        case .pushViewController:
            
            operation.navController.pushHandler(operation.vc!, shouldAnimate: operation.animated)
            
        case .popViewController:
            operation.navController.popHandler(shouldAnimate: operation.animated)
        
        case .popToRootViewController:
            operation.navController.popToRootHandler(shouldAnimate: operation.animated)
        
        }
        
    }
    
    fileprivate func addNavigationOperation(operation: (actionType:NavigationActions, navController: UINavigationController, vc: UIViewController?, animated: Bool)) {
        self.operationQueue.append(operation)
        self.processOperationQueue()
    }
    
    fileprivate func processDoneCallback() {
        
        self.alterProcessingState(isProcessing: false)
        self.processOperationQueue()
    }
    
}
