//
//  Style.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

public protocol Styler {

    var color: ColorStyler { get }
    var dimension: DimensionStyler { get }
    var font: FontStyler { get }

}

public extension Styler {

    var color: ColorStyler { ColorStyle() }
    var dimension: DimensionStyler { DimensionStyle() }
    var font: FontStyler { FontStyle() }

}

// Concrete object that contains style constants
public struct Style: Styler {

    public static let `default` = Style()

    private init() {}

}
