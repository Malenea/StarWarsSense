//
//  Coordinator.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2020 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

// MARK: Generic coordinator protocol
protocol Coordinator {

    var childCoordinators: [Coordinator] { get set }
    var navigationController: NavigationController { get set }

    func start()

}
