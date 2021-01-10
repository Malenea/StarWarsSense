//
//  PeopleCell.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

class PeopleCell: ItemCell {

    // MARK: - Identifier
    static let reuseIdentifier = "PeopleCell"

    // MARK: - Items
    private var character: Character?

    // MARK: - Cycle life
    override func updateCell(type: ItemType) {
        super.updateCell(type: type)

        character = type.item as? Character
    }

}
