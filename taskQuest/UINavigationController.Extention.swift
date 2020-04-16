//
//  UINavigationController.Extention.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/16.
//  Copyright © 2020 momota-fukuda. All rights reserved.
//

import UIKit

extension UINavigationController {

    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let viewController = viewControllers.filter({$0.isKind(of: ofClass)}).last {
            popToViewController(viewController, animated: animated)
        }
    }

    func popViewControllers(viewsToPop: Int, animated: Bool = true) {
        if viewControllers.count > viewsToPop {
            let viewController = viewControllers[viewControllers.count - viewsToPop - 1]
            popToViewController(viewController, animated: animated)
        }
    }
}
