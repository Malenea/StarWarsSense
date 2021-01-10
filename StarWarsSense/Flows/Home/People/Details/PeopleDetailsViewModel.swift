//
//  PeopleDetailsViewModel.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

final class PeopleDetailsViewModel: ViewModel {

    // MARK: - Properties
    public var character: Character

    // MARK: - Life cycle
    init(character: Character) {
        self.character = character
    }

}
