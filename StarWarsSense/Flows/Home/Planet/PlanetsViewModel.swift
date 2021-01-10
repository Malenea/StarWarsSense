//
//  PlanetsViewModel.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

final class PlanetsViewModel: ViewModel {

    // MARK: - Observers
    public var planetsUpdated: BoolEvent = .init()

    // MARK: - Properties
    public var planets: [Planets?] = [] {
        didSet {
            isFetching = false
            isEmpty = planets.isEmpty
            planetsUpdated.trigger(!planets.isEmpty)
        }
    }

    // MARK: - Life cycle
    override init() {
        super.init()

        updatePlanets()
    }

}

extension PlanetsViewModel {

    func updatePlanets() {
        PlanetsHandler.shared.getPlanets { [weak self] planets, error in
            self?.planets.append(planets)
        }
    }

    func fetchNext() {
        if let lastSection = planets.last, let nextURL = lastSection?.next {
            PlanetsHandler.shared.getPage(pageURL: nextURL) { [weak self] planets, error in
                self?.planets.append(planets)
            }
        }
    }

}

// MARK: - Datasource for the people table view
extension PlanetsViewModel: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        planets.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planets[section]?.results.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlanetsCell.reuseIdentifier, for: indexPath) as? PlanetsCell else { return UITableViewCell() }
        if let results = planets[indexPath.section]?.results {
            cell.updateCell(type: .planets(results[indexPath.row]))
        }
        cell.selectionStyle = .none
        return cell
    }

}
