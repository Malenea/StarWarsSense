//
//  ItemCell.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

enum ItemType {

    case characters(Character?)
    case planets(Planet?)
    case vehicles(Vehicle?)

}

extension ItemType {

    var item: Any? {
        switch self {
            case .characters(let character):
                return character
            case .planets(let planet):
                return planet
            case .vehicles(let vehicle):
                return vehicle
        }
    }

    var title: String {
        switch self {
            case .characters(let character):
                return character?.name ?? ""
            case .planets(let planet):
                return planet?.name ?? ""
            case .vehicles(let vehicle):
                return vehicle?.name ?? ""
        }
    }

    var background: UIImage? {
        switch self {
            case .characters:
                return UIImage(named: "characters")
            case .planets:
                return UIImage(named: "planets")
            case .vehicles:
                return UIImage(named: "vehicles")
        }
    }

}

class ItemCell: TableViewCell {

    // MARK: - Components
    private lazy var containerView = makeContainerView()
    private lazy var titleLabel = makeTitleLabel()

    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupUI()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func updateCell(type: ItemType) {
        titleLabel.text = type.title
        containerView.image = type.background
    }

}

private extension ItemCell {

    func setupUI() {
        contentView.prepareSubviewsForAutolayout(containerView, titleLabel)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: cachedStyle.dimension.common.verticalSpacing.small),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -cachedStyle.dimension.common.verticalSpacing.small),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: cachedStyle.dimension.common.horizontalSpacing.medium),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -cachedStyle.dimension.common.horizontalSpacing.medium),
            containerView.heightAnchor.constraint(equalToConstant: cachedStyle.dimension.common.cellDefaultSize),

            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }

}

private extension ItemCell {

    func makeContainerView() -> UIImageView {
        let containerView = UIImageView()
        containerView.roundView(with: cachedStyle.dimension.common.cornerRadius.medium)
        containerView.borderView()
        containerView.contentMode = .scaleAspectFill
        containerView.alpha = 0.3
        return containerView
    }

    func makeTitleLabel() -> Label {
        let titleLabel = Label.createSubtitleMultilineLabel()
        return titleLabel
    }

}
