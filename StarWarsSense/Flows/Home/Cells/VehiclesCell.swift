//
//  VehiclesCell.swift
//  StarWarsSense
//
//  Created by Motionmetrics on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

class VehiclesCell: ItemCell {

    // MARK: - Identifier
    static let reuseIdentifier = "VehiclesCell"

    // MARK: - Items
    private var vehicle: Vehicle?

    // MARK: - Cycle life
    override func updateCell(type: ItemType) {
        super.updateCell(type: type)

        vehicle = type.item as? Vehicle
    }

}
