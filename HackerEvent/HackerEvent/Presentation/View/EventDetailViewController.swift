//
//  EventDetailViewController.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 16/1/2023.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    
    let viewModel: EventDetailViewControllerViewModel

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var dateTimeLabel: UILabel!
    
    @IBOutlet var eventNameLabel: UILabel!
    
    @IBOutlet var statusImage: UIImageView!
    internal init(viewModel: EventDetailViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateUI()
        self.navigationItem.setHidesBackButton(true, animated: true)
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true
    }
    
    private func populateUI() {
        eventNameLabel.text = viewModel.event.name
        if viewModel.event.status == "CODING" {
            statusImage.image = UIImage(named: "GreenDot")
        } else {
            statusImage.image = UIImage(named: "GreyDot")
        }
    }

    @IBAction func backbutton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
  
    @IBAction func saveEventButton(_ sender: Any) {
        
    }
}
