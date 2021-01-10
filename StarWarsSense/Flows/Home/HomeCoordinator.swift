//
//  HomeCoordinator.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Init and initial methods
final class HomeCoordinator: Coordinator {

    // MARK: - Coordinators and navigation controller
    var childCoordinators = [Coordinator]()
    var navigationController: NavigationController

    // MARK: - Start function
    func start() {
        let peopleViewController = PeopleViewController(viewModel: PeopleViewModel())
        peopleViewController.rootCoordinator = self
        let peopleTab = TabBarItem()
        peopleTab.title = "Peoples"
        peopleViewController.tabBarItem = peopleTab

        let planetViewController = PlanetsViewController(viewModel: PlanetsViewModel())
        planetViewController.rootCoordinator = self
        let planetTab = TabBarItem()
        planetTab.title = "Planets"
        planetViewController.tabBarItem = planetTab

        let vehicleViewController = VehiclesViewController(viewModel: VehiclesViewModel())
        vehicleViewController.rootCoordinator = self
        let vehicleTab = TabBarItem()
        vehicleTab.title = "Vehicles"
        vehicleViewController.tabBarItem = vehicleTab

        let tabBarController = TabBarController()
        tabBarController.viewControllers = [peopleViewController, planetViewController, vehicleViewController]
        navigationController.pushViewController(tabBarController, animated: false)
    }

    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }

}

// MARK: - Details view
extension HomeCoordinator {

    func detailsViewFor(type: ItemType) {
        switch type {
            case .characters(let character):
                guard let character = character else { return }
                let vc = PeopleDetailsViewController(viewModel: PeopleDetailsViewModel(character: character))
                vc.rootCoordinator = self
                navigationController.pushViewController(vc, animated: true)
            case .planets(let planet):
                guard let planet = planet else { return }
                let vc = PlanetDetailsViewController(viewModel: PlanetDetailsViewModel(planet: planet))
                vc.rootCoordinator = self
                navigationController.pushViewController(vc, animated: true)
            case .vehicles(let vehicle):
                guard let vehicle = vehicle else { return }
                let vc = VehicleDetailsViewController(viewModel: VehicleDetailsViewModel(vehicle: vehicle))
                vc.rootCoordinator = self
                navigationController.pushViewController(vc, animated: true)
        }
    }

    func dismissDetailsView() {
        navigationController.popViewController(animated: true)
    }

}
