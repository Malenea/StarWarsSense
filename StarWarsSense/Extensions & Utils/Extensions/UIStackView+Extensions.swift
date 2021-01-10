//
//  UIStackView+Extensions.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Add subviews
extension UIStackView {

    func addArrangedSubviews(_ subviews: UIView...) {
        addArrangedSubviews(subviews)
    }

    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            addArrangedSubview($0)
        }
    }

}
