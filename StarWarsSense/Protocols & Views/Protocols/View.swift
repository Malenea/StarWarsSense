//
//  View.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2020 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

open class View: UIView, Stylable {

    // MARK: - Properties
    public var customStyle: Styler? {
        didSet { styleChildren() }
    }

    public let onStyleChange = TriggeredEvent<Styler>()

    public private(set) lazy var cachedStyle: Styler = currentStyle()

    // MARK: - Life Cycle
    public required init() {
        super.init(frame: .zero)

        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    override open func didMoveToSuperview() {
        super.didMoveToSuperview()

        styleChildren()
    }

    override open func removeFromSuperview() {
        super.removeFromSuperview()

        styleChildren()
    }

    override open func didMoveToWindow() {
        super.didMoveToWindow()

        styleChildren()
    }

    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        styleDidChange()
    }

    // MARK: - Methods
    open func setup() {
        preservesSuperviewLayoutMargins = true

        styleDidChange()
    }

    open func styleDidChange() {
        cachedStyle = currentStyle()
        onStyleChange.trigger(cachedStyle)
    }
    
}

open class Control: UIControl, Stylable {

    // MARK: - Properties
    public var customStyle: Styler? {
        didSet { styleChildren() }
    }

    public let onStyleChange = TriggeredEvent<Styler>()

    public private(set) lazy var cachedStyle: Styler = currentStyle()

    // MARK: - Life Cycle

    public required init() {
        super.init(frame: .zero)

        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    override open func didMoveToSuperview() {
        super.didMoveToSuperview()

        styleChildren()
    }

    override open func removeFromSuperview() {
        super.removeFromSuperview()

        styleChildren()
    }

    open override func didMoveToWindow() {
        super.didMoveToWindow()

        styleChildren()
    }

    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        styleDidChange()
    }

    // MARK: - Methods
    open func setup() {
        preservesSuperviewLayoutMargins = true

        styleDidChange()
    }

    open func styleDidChange() {
        cachedStyle = currentStyle()
        onStyleChange.trigger(cachedStyle)
    }
    
}
