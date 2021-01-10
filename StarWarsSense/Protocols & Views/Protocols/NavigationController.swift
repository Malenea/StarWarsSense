//
//  NavigationController.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2020 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

class NavigationController : UINavigationController {

    override var preferredStatusBarStyle : UIStatusBarStyle {
        if let topVC = viewControllers.last { return topVC.preferredStatusBarStyle }
        return .default
    }

}
