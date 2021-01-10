//
//  CommonColorStyle.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

public struct CommonColorStyle {

    private init() {}

    public static let `default` = CommonColorStyle()

    // MARK: - Background
    public var background: UIColor = StarWarsSenseColors.offWhite
    public var negativeBackground: UIColor = StarWarsSenseColors.charcoal

    // MARK: - Text
    public var text: UIColor = StarWarsSenseColors.charcoal
    public var textNegative: UIColor = StarWarsSenseColors.offWhite

    // MARK: - Item
    public var item: UIColor = StarWarsSenseColors.charcoal
    public var itemNegative: UIColor = StarWarsSenseColors.offWhite

    // MARK: - Separator
    public var separatorDefault: UIColor = StarWarsSenseColors.grayLighter

}
