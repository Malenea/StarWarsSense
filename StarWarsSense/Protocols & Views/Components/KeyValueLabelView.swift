//
//  KeyValueLabelView.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

final class KeyValueLabelView: View {

    // MARK: - Components
    private lazy var keyLabel: Label = makeKeyLabel()
    private lazy var valueLabel: Label = makeValueLabel()
    private lazy var spinner: UIActivityIndicatorView = makeSpinner()

    // MARK: - Items
    var key: String = "" {
        didSet {
            keyLabel.text = key
        }
    }
    var value: String = "" {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.spinner.stopAnimating()
                self.valueLabel.text = self.value
            }
        }
    }

    // MARK: - Life Cycle
    required init() {
        super.init()

        setupUI()
        styleDidChange()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupUI()
        styleDidChange()
    }

    override func styleDidChange() {
        super.styleDidChange()
    }

    func animate() {
        spinner.startAnimating()
    }

}

private extension KeyValueLabelView {

    func setupUI() {
        prepareSubviewsForAutolayout(keyLabel, valueLabel, spinner)

        NSLayoutConstraint.activate([
            keyLabel.topAnchor.constraint(equalTo: topAnchor, constant: cachedStyle.dimension.common.verticalSpacing.small),
            keyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: cachedStyle.dimension.common.horizontalSpacing.medium),

            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: cachedStyle.dimension.common.verticalSpacing.small),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -cachedStyle.dimension.common.horizontalSpacing.medium),
            valueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: keyLabel.trailingAnchor, constant: cachedStyle.dimension.common.horizontalSpacing.medium),

            spinner.trailingAnchor.constraint(equalTo: valueLabel.leadingAnchor, constant: -cachedStyle.dimension.common.horizontalSpacing.medium),
            spinner.centerYAnchor.constraint(equalTo: valueLabel.centerYAnchor),

            /// Auto-layout
            bottomAnchor.constraint(greaterThanOrEqualTo: keyLabel.bottomAnchor, constant: cachedStyle.dimension.common.verticalSpacing.small),
            bottomAnchor.constraint(greaterThanOrEqualTo: valueLabel.bottomAnchor, constant: cachedStyle.dimension.common.verticalSpacing.small)
        ])
    }
    
}

private extension KeyValueLabelView {

    func makeKeyLabel() -> Label {
        let keyLabel = Label.createSubtitleLabel()
        keyLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return keyLabel
    }

    func makeValueLabel() -> Label {
        let valueLabel = Label.createDefaultMultilineLabel()
        valueLabel.textAlignment = .right
        valueLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        valueLabel.text = "Fetching..."
        return valueLabel
    }

    func makeSpinner() -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: .medium)
        return spinner
    }

}
