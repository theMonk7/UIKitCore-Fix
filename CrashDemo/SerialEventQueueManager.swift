//
//  SerialEventQueueManager.swift
//  orion-ios
//
//  Created by Utkarsh Raj on 14/03/23.
//

import Foundation
import Collections
import UIKit

class SerialEventQueueManager {
    private var operationQueue: Deque<(actionType:NavigationActions, navController: UINavigationController?, vc: UIViewController?, animated: Bool)> = []
    private var isProcessing = false
    
    static let shared: SerialEventQueueManager = {
        print("UO")
        return SerialEventQueueManager()
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
            
            operation.navController?.pushHandler(operation.vc!, navController: operation.navController, shouldAnimate: operation.animated)
            
        case .popViewController:
            operation.navController?.popHandler(navController: operation.navController, shouldAnimate: operation.animated)
        
        case .popToRootViewController:
            operation.navController?.popToRootHandler(navController: operation.navController, shouldAnimate: operation.animated)
        
        }
        
    }
    
    public func addNavigationOperation(operation: (actionType:NavigationActions, navController: UINavigationController?, vc: UIViewController?, animated: Bool)) {
        self.operationQueue.append(operation)
        self.processOperationQueue()
    }
    
    public func processDoneCallback() {
        
        self.alterProcessingState(isProcessing: false)
        self.processOperationQueue()
    }
    
}
