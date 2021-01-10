//
//  Label.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

public struct LabelConfig {

    let font: UIFont
    let textColor: UIColor
    let backgroundColor: UIColor
    let textAlignement: NSTextAlignment
    let labelLines: LabelLines

    init(font: UIFont = FontStyle().common.defaultFont, textColor: UIColor = ColorStyle().common.text, backgroundColor: UIColor = .clear, textAlignement: NSTextAlignment = .natural, labelLines: LabelLines = .single) {
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.textAlignement = textAlignement
        self.labelLines = labelLines
    }

}

public enum LabelLines {

    case multi
    case single
    case double
    case triple
    case custom(Int)

}

public extension LabelLines {

    var value: Int {
        switch self {
            case .multi:
                return 0
            case .single:
                return 1
            case .double:
                return 2
            case .triple:
                return 3
            case .custom(let value):
                return value
        }
    }

}

public class Label: UILabel {

    // MARK: - Life cycle
    required init(frame: CGRect = .zero, config: LabelConfig) {
        super.init(frame: frame)

        adjustsFontForContentSizeCategory = true
        isAccessibilityElement = true
        font = config.font
        textColor = config.textColor
        backgroundColor = config.backgroundColor
        textAlignment = config.textAlignement
        numberOfLines = config.labelLines.value
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

public extension Label {

    static func createDefaultLabel() -> Label {
        Label(config: .init())
    }

    static func createDefaultMultilineLabel() -> Label {
        Label(config: .init(labelLines: .multi))
    }

    static func createSubtitleLabel() -> Label {
        Label(config: .init(font: FontStyle().common.subTitleBoldFont, labelLines: .single))
    }

    static func createSubtitleMultilineLabel() -> Label {
        Label(config: .init(font: FontStyle().common.subTitleBoldFont, labelLines: .multi))
    }

    static func createTitleMultilineLabel() -> Label {
        Label(config: .init(font: FontStyle().common.titleBoldFont, labelLines: .multi))
    }

}
