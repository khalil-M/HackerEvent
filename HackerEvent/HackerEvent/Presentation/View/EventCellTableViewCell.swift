//
//  EventCellTableViewCell.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 16/1/2023.
//

import UIKit

class EventCellTableViewCell: UITableViewCell, CellProtocol {
    

    @IBOutlet var eventNameLabel: UILabel!
    @IBOutlet var startTimeLabel: UILabel!
    @IBOutlet var endTimeLabel: UILabel!
    
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
        eventNameLabel.text = viewModel.name
        startTimeLabel.text = "From \(viewModel.start_time)"
        endTimeLabel.text = "to \(viewModel.end_time)"
    }
    
}
