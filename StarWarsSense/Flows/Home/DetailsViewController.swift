//
//  DetailsViewController.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import UIKit
import Foundation

class DetailsViewController: ViewController {

    // MARK: - Coordinator and model
    public weak var rootCoordinator: HomeCoordinator?

    // MARK: - Components
    lazy var backButton: Button = makeBackButton()
    lazy var titleLabel: Label = makeTitleLabel()
    lazy var scrollView: UIScrollView = makeScrollView()
    lazy var stackView: UIStackView = makeStackView()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        styleDidChange()
    }

    override func styleDidChange() {
        view.backgroundColor = cachedStyle.color.common.background
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }

}

// MARK: - UI setup
private extension DetailsViewController {

    func setupUI() {
        view.prepareSubviewsForAutolayout(backButton, titleLabel, scrollView)
        scrollView.prepareSubviewsForAutolayout(stackView)

        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: cachedStyle.dimension.common.horizontalSpacing.medium),
            backButton.heightAnchor.constraint(equalToConstant: cachedStyle.dimension.common.componentDefaultSize),
            backButton.widthAnchor.constraint(equalToConstant: cachedStyle.dimension.common.componentDefaultSize),

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: cachedStyle.dimension.common.verticalSpacing.xLarge),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: cachedStyle.dimension.common.horizontalSpacing.medium),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -cachedStyle.dimension.common.horizontalSpacing.medium),

            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: cachedStyle.dimension.common.verticalSpacing.large),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -cachedStyle.dimension.common.verticalSpacing.medium),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: cachedStyle.dimension.common.horizontalSpacing.medium),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -cachedStyle.dimension.common.horizontalSpacing.medium),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

}

// MARK: - Components creation methods
private extension DetailsViewController {

    func makeBackButton() -> Button {
        let backButton = Button()
        backButton.setImage(UIImage(named: "ic_backArrow"), for: .normal)
        backButton.tapEvent.addObserver(self) { scene, _ in
            scene.rootCoordinator?.dismissDetailsView()
        }
        return backButton
    }

    func makeTitleLabel() -> Label {
        let titleLabel = Label.createTitleMultilineLabel()
        return titleLabel
    }

    func makeScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        return scrollView
    }

    func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }

}
