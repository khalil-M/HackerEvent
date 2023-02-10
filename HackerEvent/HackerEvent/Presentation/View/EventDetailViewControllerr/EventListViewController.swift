//
//  EventListViewController.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 13/1/2023.
//

import UIKit
import Foundation
class EventListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let viewModel: EventListViewControllerViewModel
    let router: EventListRouting
    
    init(viewModel: EventListViewControllerViewModel, router: EventListRouting) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: "EventListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        registerCell()
        viewModel.getData()
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "EventCellTableViewCell", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "EventCellTableViewCell")
    }
    
    
}

extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.itemAt(indexPath: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventCellTableViewCell", for: indexPath) as? EventCellTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: cellViewModel)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = viewModel.getEventForIndexPath(indexPath: indexPath)
        router.routeToEventDetails(for: event)
    }
    
}
