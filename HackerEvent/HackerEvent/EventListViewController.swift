//
//  EventListViewController.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 13/1/2023.
//

import UIKit

class EventListViewController: UIViewController {
    
    let viewModel: EventListViewControllerViewModel
    
    init(viewModel: EventListViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "EventListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getData()
    }


}
