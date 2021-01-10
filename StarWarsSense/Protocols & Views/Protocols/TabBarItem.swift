//
//  TabBarItem.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

class TabBarItem: UITabBarItem {

    // MARK: - Cycle life
    override init() {
        super.init()

        let appearance = UITabBarItem.appearance()
        let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: FontStyle().common.defaultBoldFont]
        appearance.setTitleTextAttributes(attributes, for: .normal)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        let appearance = UITabBarItem.appearance()
        let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: FontStyle().common.defaultBoldFont]
        appearance.setTitleTextAttributes(attributes, for: .normal)
    }
    
}
