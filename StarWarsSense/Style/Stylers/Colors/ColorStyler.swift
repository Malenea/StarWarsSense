//
//  ColorStyler.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

public protocol ColorStyler {

    var common: CommonColorStyle { get }

}

// Defines default values for color constants.
public extension ColorStyler {

    var common: CommonColorStyle { .default }

}

// Concrete object for color constants.
public struct ColorStyle: ColorStyler {

    public init() {}

}
