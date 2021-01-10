//
//  VehicleDetailsViewController.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

final class VehicleDetailsViewController: DetailsViewController {

    // MARK: - Coordinator and model
    private var rootViewModel: VehicleDetailsViewModel? {
        self.viewModel as? VehicleDetailsViewModel
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = rootViewModel?.vehicle.name ?? ""

        guard let vehicle = rootViewModel?.vehicle else { return }
        for item in Mirror(reflecting: vehicle).children {
            guard let key = item.label else { continue }
            let formattedKey = (key.replacingOccurrences(of: "_", with: " "))
            let keyValueLabelView = KeyValueLabelView()
            keyValueLabelView.key = formattedKey
            keyValueLabelView.animate()
            switch formattedKey {
                case "pilots":
                    guard let peopleUrls = item.value as? [String], !peopleUrls.isEmpty else { continue }
                    ValueFormatter.getFormatted(type: .multiURL(.people, peopleUrls)) { people in
                        keyValueLabelView.value = people
                    }
                case "films":
                    guard let filmsUrls = item.value as? [String], !filmsUrls.isEmpty else { continue }
                    ValueFormatter.getFormatted(type: .multiURL(.films, filmsUrls)) { films in
                        keyValueLabelView.value = films
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
