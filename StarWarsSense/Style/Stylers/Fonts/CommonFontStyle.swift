//
//  CommonFontStyle.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

// Defines default values for common fonts.
public struct CommonFontStyle {
    
    // MARK: - Fonts
    public var titleBoldFont: UIFont = UIFont(name: "SFDistantGalaxy", size: 24.0) ?? UIFont.systemFont(ofSize: 24.0, weight: .semibold)
    public var titleFont: UIFont = UIFont(name: "AnakinMono", size: 24.0) ?? UIFont.systemFont(ofSize: 24.0, weight: .semibold)
    public var subTitleBoldFont: UIFont = UIFont(name: "SFDistantGalaxy", size: 16.0) ?? UIFont.systemFont(ofSize: 16.0, weight: .bold)
    public var subTitleFont: UIFont = UIFont(name: "AnakinMono", size: 16.0) ?? UIFont.systemFont(ofSize: 16.0, weight: .semibold)
    public var defaultBoldFont: UIFont = UIFont(name: "SFDistantGalaxy", size: 12.0) ?? UIFont.systemFont(ofSize: 12.0, weight: .regular)
    public var defaultFont: UIFont = UIFont(name: "AnakinMono", size: 12.0) ?? UIFont.systemFont(ofSize: 12.0, weight: .regular)

    public init() {
    }

}
