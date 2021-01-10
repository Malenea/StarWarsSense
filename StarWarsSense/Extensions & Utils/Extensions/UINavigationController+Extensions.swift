//
//  UINavigationController+Extensions.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {

    func presentFromRight(_ viewController: UIViewController) {
        guard let window = view.window else { return }
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        window.layer.add(transition, forKey: kCATransition)
        present(viewController, animated: false, completion: nil)
    }

}
