//
//  NavigationControllerExtensions.swift
//  MathQuiz
//
//  Created by Emre ÖKTEM on 17.08.2021.
//

import UIKit

extension UINavigationController {
    
    func replaceCurrentView (withViewController vc: UIViewController) {
        self.viewControllers.append(vc)
        self.viewControllers.remove(at: 0)
    }
}
