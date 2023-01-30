//
//  AbstractCell.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 16/1/2023.
//

import Foundation

import Foundation
public protocol CellViewProtocol {
     var cellType: CellType { get }
}

protocol CellProtocol {
    func configure(with viewModel: CellViewProtocol)
    func testBuildOnCi()
}

public enum CellType: String, CaseIterable {
case eventCell = "eventCell"
    
    var nibName: String {
        switch self {
        case .eventCell:
            return "eventCell"
        }
    }
    var identifier: String {
        return self.rawValue
    }
}
