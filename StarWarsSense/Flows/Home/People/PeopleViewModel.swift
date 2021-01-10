//
//  PeopleViewModel.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

final class PeopleViewModel: ViewModel {

    // MARK: - Observers
    public var peopleUpdated: BoolEvent = .init()

    // MARK: - Properties
    public var people: [People?] = [] {
        didSet {
            isFetching = false
            isEmpty = people.isEmpty
            peopleUpdated.trigger(!people.isEmpty)
        }
    }

    // MARK: - Life cycle
    override init() {
        super.init()

        updatePeople()
    }

}

extension PeopleViewModel {

    func updatePeople() {
        PeopleHandler.shared.getPeople { [weak self] people, error in
            self?.people.append(people)
        }
    }

    func fetchNext() {
        if let lastSection = people.last, let nextURL = lastSection?.next {
            PeopleHandler.shared.getPage(pageURL: nextURL) { [weak self] people, error in
                self?.people.append(people)
            }
        }
    }

}

// MARK: - Datasource for the people table view
extension PeopleViewModel: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        people.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people[section]?.results.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PeopleCell.reuseIdentifier, for: indexPath) as? PeopleCell else { return UITableViewCell() }
        if let results = people[indexPath.section]?.results {
            cell.updateCell(type: .characters(results[indexPath.row]))
        }
        cell.selectionStyle = .none
        return cell
    }

}
