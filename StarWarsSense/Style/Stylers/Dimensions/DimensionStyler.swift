//
//  DimensionStyler.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

// A configurator that defines constants view sizes.
public protocol DimensionStyler {

    var common: CommonDimensionStyle { get }

}

// Default dimension values.
public extension DimensionStyler {

    var common: CommonDimensionStyle { .init() }

}

// Concrete object for dimesnion constants.
public struct DimensionStyle: DimensionStyler {

    public init() {}

}
