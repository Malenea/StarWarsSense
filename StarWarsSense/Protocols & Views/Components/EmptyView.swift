//
//  EmptyView.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

final class EmptyView: View {

    // MARK: - Observers
    public var tappedRefreshButton: VoidEvent = .init()

    // MARK: - Components
    private lazy var backgroundImageView = makeBackgroundImageView()
    private lazy var titleLabel = makeTitleLabel()
    private lazy var refreshButton = makeRefreshButton()

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
        titleLabel.font = cachedStyle.font.common.subTitleFont
        titleLabel.textColor = cachedStyle.color.common.textNegative

        refreshButton.backgroundColor = cachedStyle.color.common.negativeBackground
    }

}

// MARK: - UI setup
private extension EmptyView {

    func setupUI() {
        blurView()

        prepareSubviewsForAutolayout(backgroundImageView, titleLabel, refreshButton)
        NSLayoutConstraint.activate([
            backgroundImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: -cachedStyle.dimension.common.horizontalSpacing.large),
            backgroundImageView.heightAnchor.constraint(equalTo: widthAnchor, constant: -cachedStyle.dimension.common.horizontalSpacing.large),

            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            titleLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.8),

            refreshButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: cachedStyle.dimension.common.verticalSpacing.xLarge),
            refreshButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            refreshButton.heightAnchor.constraint(equalToConstant: cachedStyle.dimension.common.componentDefaultSize),
            refreshButton.widthAnchor.constraint(equalToConstant: cachedStyle.dimension.common.componentDefaultSize)
        ])

        refreshButton.roundView(with: cachedStyle.dimension.common.componentDefaultSize / 2.0)
    }

}

// MARK: - Components creation methods
private extension EmptyView {

    func makeBackgroundImageView() -> UIImageView {
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "notFound")
        backgroundImageView.alpha = 0.3
        return backgroundImageView
    }

    func makeTitleLabel() -> Label {
        let titleLabel = Label.createDefaultMultilineLabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "We couldn't find any result, please refresh this page to retry."
        return titleLabel
    }

    func makeRefreshButton() -> Button {
        let refreshButton = Button()
        refreshButton.setImage(UIImage(named: "ic_refresh")?.tinted(with: cachedStyle.color.common.itemNegative), for: .normal)
        refreshButton.tapEvent.addObserver(self) { scene in
            scene.tappedRefreshButton.trigger()
        }
        return refreshButton
    }

}
