//
//  PeopleViewController.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

final class PeopleViewController: ItemViewController {

    // MARK: - Coordinator and model
    private var rootViewModel: PeopleViewModel? {
        self.viewModel as? PeopleViewModel
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Setting table view datasource
        tableView.dataSource = rootViewModel

        /// Setting up event observer for update data
        rootViewModel?.peopleUpdated.addObserver(self) { scene, isPopulated in
            scene.updateLoadingAndEmptyViews()
            if isPopulated {
                scene.emptyView.fadeOut()
            } else {
                scene.emptyView.fadeIn()
            }
            DispatchQueue.main.async {
                scene.tableView.reloadData()
            }
        }
    }

}

// MARK: - Table view delegate
extension PeopleViewController {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let character = rootViewModel?.people[indexPath.section]?.results[indexPath.row] else { return }
        rootCoordinator?.detailsViewFor(type: .characters(character))
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let rootViewModel = rootViewModel, let section = rootViewModel.people[indexPath.section],
           indexPath.section == rootViewModel.people.count - 1,
           indexPath.row == section.results.count - 5 {
            rootViewModel.fetchNext()
        }
    }

}
