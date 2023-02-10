//
//  EventCellTableViewCell.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 16/1/2023.
//

import UIKit

class EventCellTableViewCell: UITableViewCell, CellProtocol {
    func testBuildOnCi() {
        
    }
    
    

    @IBOutlet var eventNameLabel: UILabel!
    @IBOutlet var startTimeLabel: UILabel!
    @IBOutlet var endTimeLabel: UILabel!
    @IBOutlet var statusImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: CellViewProtocol) {
        guard let viewModel = viewModel as? EventCellViewModel else { return }
        let startDate = viewModel.getDate(date: viewModel.start_time)
        let endDate = viewModel.getDate(date: viewModel.end_time)
        if viewModel.status == "CODING" {
            statusImage.image = UIImage(named: "GreenDot")
        } else {
            statusImage.image = UIImage(named: "GreyDot")
        }
        eventNameLabel.text = viewModel.name
        startTimeLabel.text = "From \(startDate)"
        endTimeLabel.text = "to \(endDate)"
    }
    
}
