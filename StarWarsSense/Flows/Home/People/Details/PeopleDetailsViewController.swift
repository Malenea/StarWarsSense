//
//  PeopleDetailsViewController.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

final class PeopleDetailsViewController: DetailsViewController {

    // MARK: - Coordinator and model
    private var rootViewModel: PeopleDetailsViewModel? {
        self.viewModel as? PeopleDetailsViewModel
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = rootViewModel?.character.name ?? ""

        guard let character = rootViewModel?.character else { return }
        for item in Mirror(reflecting: character).children {
            guard let key = item.label else { continue }
            let formattedKey = (key.replacingOccurrences(of: "_", with: " "))
            let keyValueLabelView = KeyValueLabelView()
            keyValueLabelView.key = formattedKey
            keyValueLabelView.animate()
            switch formattedKey {
                case "homeworld":
                    guard let planetUrl = item.value as? String else { continue }
                    ValueFormatter.getFormatted(type: .url(.planets, planetUrl)) { planet in
                        keyValueLabelView.value = planet
                    }
                case "films":
                    guard let filmsUrls = item.value as? [String], !filmsUrls.isEmpty else { continue }
                    ValueFormatter.getFormatted(type: .multiURL(.films, filmsUrls)) { films in
                        keyValueLabelView.value = films
                    }
                case "species":
                    guard let speciesUrls = item.value as? [String], !speciesUrls.isEmpty else { continue }
                    ValueFormatter.getFormatted(type: .multiURL(.species, speciesUrls)) { species in
                        keyValueLabelView.value = species
                    }
                case "vehicles":
                    guard let vehiclesUrls = item.value as? [String], !vehiclesUrls.isEmpty else { continue }
                    ValueFormatter.getFormatted(type: .multiURL(.vehicles, vehiclesUrls)) { vehicles in
                        keyValueLabelView.value = vehicles
                    }
                case "starships":
                    guard let starshipsUrls = item.value as? [String], !starshipsUrls.isEmpty else { continue }
                    ValueFormatter.getFormatted(type: .multiURL(.starships, starshipsUrls)) { starships in
                        keyValueLabelView.value = starships
                    }
                case "name", "url", "created", "edited":
                    continue
                default:
                    keyValueLabelView.value = "\(item.value)"
            }
            stackView.addArrangedSubview(keyValueLabelView)
        }
    }

}
