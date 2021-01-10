//
//  VehiclesViewModel.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

final class VehiclesViewModel: ViewModel {

    // MARK: - Observers
    public var vehiclesUpdated: BoolEvent = .init()

    // MARK: - Properties
    public var vehicles: [Vehicles?] = [] {
        didSet {
            isFetching = false
            isEmpty = vehicles.isEmpty
            vehiclesUpdated.trigger(!vehicles.isEmpty)
        }
    }

    // MARK: - Life cycle
    override init() {
        super.init()

        updateVehicles()
    }

}

extension VehiclesViewModel {

    func updateVehicles() {
        VehiclesHandler.shared.getVehicles { [weak self] vehicles, error in
            self?.vehicles.append(vehicles)
        }
    }

    func fetchNext() {
        if let lastSection = vehicles.last, let nextURL = lastSection?.next {
            VehiclesHandler.shared.getPage(pageURL: nextURL) { [weak self] vehicles, error in
                self?.vehicles.append(vehicles)
            }
        }
    }

}

// MARK: - Datasource for the people table view
extension VehiclesViewModel: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        vehicles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vehicles[section]?.results.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VehiclesCell.reuseIdentifier, for: indexPath) as? VehiclesCell else { return UITableViewCell() }
        if let results = vehicles[indexPath.section]?.results {
            cell.updateCell(type: .vehicles(results[indexPath.row]))
        }
        cell.selectionStyle = .none
        return cell
    }

}
