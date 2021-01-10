//
//  FontStyler.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

// A configurator that defines constants view sizes.
public protocol FontStyler {

    var common: CommonFontStyle { get }

}

// Default dimension values.
public extension FontStyler {

    var common: CommonFontStyle { .init() }

}

// Concrete object for dimesnion constants.
public struct FontStyle: FontStyler {

    public init() {}

}
