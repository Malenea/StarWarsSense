//
//  ViewController.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2020 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

open class ViewController: UIViewController, Stylable {

    // MARK: - Properties
    private(set) var viewModel: ViewModel?

    public var customStyle: Styler? {
        get { rootView.customStyle }
        set { rootView.customStyle = newValue }
    }

    public var cachedStyle: Styler { rootView.cachedStyle }

    // Stylable root view
    private var rootView: View { view.require() }

    // Life cycle
    open override func loadView() {
        let view = View()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.onStyleChange.addObserver(self) { $0.styleDidChange($1) }
        self.view = view
    }

    init(nibName: String? = nil, bundle: Bundle? = nil, viewModel: ViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nibName, bundle: bundle)

        print("💚 Initiated view controller")
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)

        print("💚 Initiated view controller with coder")
    }

    deinit {
        print("💖 De-initiated view controller")
    }

    // MARK: - Style
    public func currentStyle() -> Styler {
        rootView.currentStyle()
    }

    open func styleDidChange() {
    }

    open func styleDidChange(_ style: Styler) {
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

}
