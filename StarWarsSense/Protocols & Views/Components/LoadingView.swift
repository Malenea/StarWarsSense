//
//  LoadingView.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

final class LoadingView: View {

    // MARK: - Components
    private lazy var fetchingLabel = makeFetchingLabel()
    private lazy var spinner = makeSpinner()

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
        fetchingLabel.textColor = cachedStyle.color.common.textNegative
        spinner.color = cachedStyle.color.common.itemNegative
    }

    func animate() {
        DispatchQueue.main.async { [weak self] in
            self?.spinner.startAnimating()
        }
    }

    func stop() {
        DispatchQueue.main.async { [weak self] in
            self?.spinner.stopAnimating()
        }
    }

}

// MARK: - UI setup
private extension LoadingView {

    func setupUI() {
        blurView()

        prepareSubviewsForAutolayout(fetchingLabel, spinner)
        NSLayoutConstraint.activate([
            fetchingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            fetchingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            fetchingLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: cachedStyle.dimension.common.horizontalSpacing.large),
            fetchingLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -cachedStyle.dimension.common.horizontalSpacing.large),

            spinner.bottomAnchor.constraint(equalTo: fetchingLabel.topAnchor, constant: -cachedStyle.dimension.common.verticalSpacing.medium),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}

// MARK: - Components creation methods
private extension LoadingView {

    func makeFetchingLabel() -> Label {
        let fetchingLabel = Label.createDefaultLabel()
        fetchingLabel.text = "Fetching the force..."
        return fetchingLabel
    }

    func makeSpinner() -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: .large)
        return spinner
    }

}
