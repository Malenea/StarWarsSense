//
//  PlanetDetailsViewController.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

final class PlanetDetailsViewController: DetailsViewController {

    // MARK: - Coordinator and model
    private var rootViewModel: PlanetDetailsViewModel? {
        self.viewModel as? PlanetDetailsViewModel
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = rootViewModel?.planet.name ?? ""

        guard let planet = rootViewModel?.planet else { return }
        for item in Mirror(reflecting: planet).children {
            guard let key = item.label else { continue }
            let formattedKey = (key.replacingOccurrences(of: "_", with: " "))
            let keyValueLabelView = KeyValueLabelView()
            keyValueLabelView.key = formattedKey
            keyValueLabelView.animate()
            switch formattedKey {
                case "films":
                    guard let filmsUrls = item.value as? [String], !filmsUrls.isEmpty else { continue }
                    ValueFormatter.getFormatted(type: .multiURL(.films, filmsUrls)) { films in
                        keyValueLabelView.value = films
                    }
                case "residents":
                    guard let peopleUrls = item.value as? [String], !peopleUrls.isEmpty else { continue }
                    ValueFormatter.getFormatted(type: .multiURL(.people, peopleUrls)) { people in
                        keyValueLabelView.value = people
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
