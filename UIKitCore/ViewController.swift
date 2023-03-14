//
//  ViewController.swift
//
//  Created by Utkarsh Raj on 10/03/23.
//

import UIKit

class ViewController: UIViewController {
    var flag = true
    let group = DispatchGroup()
    let queue = DispatchQueue(label: "barrierQueue",attributes: .concurrent)
    let colors: [UIColor] = [.red, .green, .blue, .yellow, .magenta, .orange, .blue]
   
    
    func pushVC() {
        let vc1 = TestViewController()
        vc1.localTitle = "This is VC 1"
        vc1.view.backgroundColor = colors[Int.random(in: 0..<colors.count)]
//        workItemYO(vc: vc1, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        title = "view controller"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        testColdStartUp()
    }
    
    func testColdStartUp() {
        
//        queue.sync {
//            DispatchQueue.main.as {
//                self.navigationController?.pushViewController(vc1, animated: false)
//            }
//        }
        
//        queue.sync(execute: workItem(vc: vc1, animated: false))
      
        
        let vc1 = TestViewController()
        vc1.localTitle = "This is VC 1"
        vc1.view.backgroundColor = colors[0]
        
        
        
        let vc2 = TestViewController()
        vc2.localTitle = "This is VC 2"
        vc2.view.backgroundColor = colors[1]

        
        
        let vc3 = TestViewController()
        vc3.localTitle = "This is VC 3"
        vc3.view.backgroundColor = colors[2]
        let vc4 = TestViewController()
        vc4.localTitle = "This is VC 4"
        vc4.view.backgroundColor = colors[3]
        let vc5 = TestViewController()
        vc5.localTitle = "This is VC 5"
        vc5.view.backgroundColor = colors[4]
        
        
//        navigationController?.topViewController?.present(vc1, animated: true, completion: nil)
//        navigationController?.presentedViewController?.present(vc2, animated: true, completion: nil)
//        navigationController?.presentedViewController?.present(vc4, animated: true, completion: nil)
        
        navigationController?.pushViewController(vc1, shouldAnimate: true)
//        navigationController?.pushViewController(vc2, shouldAnimate: true)
//        navigationController?.pushViewController(vc3, shouldAnimate: true)
//        navigationController?.pushViewController(vc4, animated: true)
//        navigationController?.pushViewController(vc5, animated: true)
//        navigationController?.pushViewController(vc4, shouldAnimate: true)
//        navigationController?.pushViewController(vc5, shouldAnimate: true)
        
//        navigationController?.pushViewController(vc1, animated: false)
//        navigationController?.pushViewController(vc2, animated: true)
//        navigationController?.pushViewController(vc3, animated: true)
        
//        navigationController?.popToRootViewController(shouldAnimate: false)
//        navigationController?.pushViewController(vc1, shouldAnimate: false)
//        navigationController?.pushViewController(vc2, shouldAnimate: true)
//        navigationController?.pushViewController(vc3, shouldAnimate: true)
        
        
//        navigationController?.pushViewController(vc1, animated: false)
//        navigationController?.pushViewController(vc2, animated: true)
//        navigationController?.pushViewController(vc3, animated: true)
////
        
//        if flag {
//            navigationController?.pushViewController(vc1, shouldAnimate: false, completion: {
//                print(1)
//                self.navigationController?.pushViewController(vc2, shouldAnimate: true, completion: {
//                    print(2)
//                    self.navigationController?.pushViewController(vc3, shouldAnimate: true, completion: {
//                        print(3)
////                        self.navigationController?.popToRootViewController(animated: true)
//                        self.navigationController?.popViewController(shouldAnimate: true, completion: {
//                          
//                            print(4)
//                            self.navigationController?.pushViewController(vc4, shouldAnimate: true, completion: {
//                                print(5)
//                                self.navigationController?.pushViewController(vc5, shouldAnimate: true, completion: {
//                                    print(5)
//
//                            })
//                        })
//                    })
//                })
//            })
//        })
//            flag = false
//        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        workItemYO(vc: vc1, animated: false)
////        navigationController?.popViewController(animated: false)
//        workItemYO(vc: vc2, animated: true)
//        workItemYO(vc: vc3, animated: true)
//        while navigationController?.viewControllers.count != 0 {
//            navigationController?.popViewController(animated: true)
//        }
        
//        navigationController?.popViewController(animated: true)
//        navigationController?.popViewController(animated: true)
//        workItemYO(vc: vc4, animated: true)
//        workItemYO(vc: vc5, animated: true)
        
        
//        self.navigationController?.pushViewController(vc1, animated: false)
//        self.navigationController?.pushViewController(vc2, animated: true)
//        self.navigationController?.pushViewController(vc3, animated: true)

      
        
//        let vc2 = TestViewController()
//        vc2.localTitle = "This is VC 2"
//        vc2.view.backgroundColor = .yellow
//        queue.sync {
//            self.navigationController?.pushViewController(vc2, animated: true)
//        }
        
//        queue.sync(execute: workItem(vc: vc2, animated: true))
//        workItemYO(vc: vc2, animated: true)
        
//        let vc3 = TestViewController()
//        vc3.localTitle = "This is VC 3"
//        vc3.view.backgroundColor = .orange
//        queue.sync {
//            self.navigationController?.pushViewController(vc3, animated: true)
//        }
        
//        queue.sync(execute: workItem(vc: vc3, animated: true))
//        workItemYO(vc: vc3, animated: true)
        
        
    }
    
//    func workItem(vc: UIViewController,animated:Bool) -> DispatchWorkItem {
//        return DispatchWorkItem(qos:.userInitiated) {
//            self.navigationController?.pushViewController(vc, animated: animated)
//        }
//    }
    
//    func workItemYO(vc: UIViewController,animated:Bool)   {
//        DispatchQueue.main.async {
//            self.navigationController?.pushViewController(vc, animated: animated)
//        }
////            self.navigationController?.pushViewController(controller: vc)
//
//    }

}

//class DMNavigationController: UINavigationController,UINavigationControllerDelegate {
//    var shouldIgnorePushingViewControllers: Bool = false
//
//    override func pushViewController(viewController: UIViewController, animated: Bool) {
//        if !self.shouldIgnorePushingViewControllers {
//            super.pushViewController(viewController, animated: animated)
//        }
//
//        self.shouldIgnorePushingViewControllers = true
//    }
//
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        super.delegate?.navigationController?(navigationController, didShow: viewController, animated: animated)
//        self.shouldIgnorePushingViewControllers = false
//    }
//
//
//}

//open class FadePopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
//
//    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 0.5
//    }
//
//    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        guard
//            let fromViewController = transitionContext.viewController(forKey: .from),
//            let toViewController = transitionContext.viewController(forKey: .to)
//        else {
//            return
//        }
//
//        transitionContext.containerView.insertSubview(toViewController.view, belowSubview: fromViewController.view)
//
//        let duration = self.transitionDuration(using: transitionContext)
//        UIView.animate(withDuration: duration, animations: {
//            fromViewController.view.alpha = 0
//        }, completion: { _ in
//            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
//        })
//    }
//}
//open class FadePushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
//
//    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 0.5
//    }
//
//    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        guard
//            let toViewController = transitionContext.viewController(forKey: .to)
//        else {
//            return
//        }
//        transitionContext.containerView.addSubview(toViewController.view)
//        toViewController.view.alpha = 0
//
//        let duration = self.transitionDuration(using: transitionContext)
//        UIView.animate(withDuration: duration, animations: {
//            toViewController.view.alpha = 1
//        }, completion: { _ in
//            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
//        })
//    }
//}
//
//extension ViewController: UINavigationControllerDelegate {
//    func navigationController(_ navigationController: UINavigationController,
//                                  animationControllerFor operation: UINavigationController.Operation,
//                                  from fromVC: UIViewController,
//                                  to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//            switch operation {
//            case .push:
//                return FadePushAnimator()
//            case .pop:
//                return FadePopAnimator()
//            default:
//                return nil
//            }
//        }
//}

//extension  UINavigationController {
//    
//    func pushViewController(_ vc: UIViewController, animateds: Bool) {
//        let transition = CATransition()
//        transition.duration = animateds ? 0.35 : 0.1
//        transition.type = CATransitionType.push
//        transition.subtype = .fromRight
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        view.window?.layer.add(transition, forKey: kCATransition)
//        pushViewController(vc, animated: false)
//        
//    }
//    
//    func popViewController(_: UIViewController) {
//        let transition = CATransition()
//        transition.duration = 0
//        transition.type = CATransitionType.push
//        transition.subtype = .fromLeft
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        view.window?.layer.add(transition, forKey: kCATransition)
//        popViewController(animated: false)
//        
//    }
//    
//    
//    
//    func popToRootViewController(animation: Bool) {
//        popToRootViewController(animated: false)
//    }
////
//    
//}
//extension UINavigationController {
//    public func pushViewController(
//        _ viewController: UIViewController,
//        animated: Bool,
//        completion: @escaping () -> Void) {
//        pushViewController(viewController, animated: animated)
//        guard animated, let coordinator = transitionCoordinator else {
//            DispatchQueue.main.async { completion() }
//            return
//        }
//        coordinator.animate(alongsideTransition: nil) { _ in completion() }
//    }
//
//    public func popViewController(
//        animated: Bool,
//        completion: @escaping () -> Void) {
//        popViewController(animated: animated)
//        guard animated, let coordinator = transitionCoordinator else {
//            DispatchQueue.main.async { completion() }
//            return
//        }
//        coordinator.animate(alongsideTransition: nil) { _ in completion() }
//    }
//
//    public func popToViewController(
//        _ viewController: UIViewController,
//        animated: Bool,
//        completion: @escaping () -> Void) {
//        popToViewController(viewController, animated: animated)
//        guard animated, let coordinator = transitionCoordinator else {
//            DispatchQueue.main.async { completion() }
//            return
//        }
//        coordinator.animate(alongsideTransition: nil) { _ in completion() }
//    }
//}
