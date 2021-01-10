//
//  VehicleDetailsViewModel.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

final class VehicleDetailsViewModel: ViewModel {

    // MARK: - Properties
    public var vehicle: Vehicle

    // MARK: - Life cycle
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }

}
