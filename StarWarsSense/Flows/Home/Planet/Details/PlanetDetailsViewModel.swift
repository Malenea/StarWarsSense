//
//  PlanetDetailsViewModel.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

final class PlanetDetailsViewModel: ViewModel {

    // MARK: - Properties
    public var planet: Planet

    // MARK: - Life cycle
    init(planet: Planet) {
        self.planet = planet
    }

}
