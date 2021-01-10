//
//  ItemViewController.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import UIKit
import Foundation

class ItemViewController: ViewController {

    // MARK: - Coordinator and model
    public weak var rootCoordinator: HomeCoordinator?

    // MARK: - Event
    public var tappedRefresh: VoidEvent = .init()

    // MARK: - Components
    lazy var tableView: TableView = makeTableView()
    lazy var loadingView: LoadingView = makeLoadingView()
    lazy var emptyView: EmptyView = makeEmptyView()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        styleDidChange()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateLoadingAndEmptyViews()
    }

    func updateLoadingAndEmptyViews() {
        loadingView.animate()
        if let viewModel = viewModel, !viewModel.isFetching {
            loadingView.stop()
            loadingView.fadeOut()
            if viewModel.isEmpty {
                emptyView.fadeIn()
            }
        }
    }

    override func styleDidChange() {
        view.backgroundColor = cachedStyle.color.common.background
        tableView.backgroundColor = cachedStyle.color.common.background
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }

}

// MARK: - UI setup
private extension ItemViewController {

    func setupUI() {
        view.prepareSubviewsForAutolayout(tableView, loadingView, emptyView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        loadingView.applyFullConstraints(to: view)
        emptyView.applyFullConstraints(to: view)
    }

}

// MARK: - Components creation methods
private extension ItemViewController {

    func makeTableView() -> TableView {
        let tableView = TableView()
        tableView.register(PeopleCell.self, forCellReuseIdentifier: PeopleCell.reuseIdentifier)
        tableView.register(PlanetsCell.self, forCellReuseIdentifier: PlanetsCell.reuseIdentifier)
        tableView.register(VehiclesCell.self, forCellReuseIdentifier: VehiclesCell.reuseIdentifier)
        tableView.delegate = self
        tableView.sectionHeaderHeight = 0.0
        tableView.sectionFooterHeight = 0.0
        return tableView
    }

    func makeLoadingView() -> LoadingView {
        let loadingView = LoadingView()
        return loadingView
    }

    func makeEmptyView() -> EmptyView {
        let emptyView = EmptyView()
        emptyView.tappedRefreshButton.addObserver(self) { scene, _ in
            scene.tappedRefresh.trigger()
        }
        emptyView.fadeOut(with: 0.0)
        return emptyView
    }

}

// MARK: - Table view delegate
extension ItemViewController: UITableViewDelegate {
}
