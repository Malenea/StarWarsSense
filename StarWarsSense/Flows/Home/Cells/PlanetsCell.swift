//
//  PlanetsCell.swift
//  StarWarsSense
//
//  Created by Motionmetrics on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

class PlanetsCell: ItemCell {

    // MARK: - Identifier
    static let reuseIdentifier = "PlanetsCell"

    // MARK: - Items
    private var planet: Planet?

    // MARK: - Cycle life
    override func updateCell(type: ItemType) {
        super.updateCell(type: type)

        planet = type.item as? Planet
    }

}
