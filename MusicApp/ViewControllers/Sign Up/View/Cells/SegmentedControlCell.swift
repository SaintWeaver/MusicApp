//
//  SegmentedControlCellTableViewCell.swift
//  MusicApp
//
//  Created by George Weaver on 16.11.2021.
//

import UIKit

protocol SegmentedCellDelegate: AnyObject {
    func segmentedTapped(_ index: Int)
}

class SegmentedControlCell: UITableViewCell {
    
    var segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Login", "Sign Up"])
        segmented.contentHorizontalAlignment = .center
        return segmented
    }()
    
    weak var delegate: SegmentedCellDelegate?

    func setupSegmentedControl() {
        contentView.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            segmentedControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            segmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    func configure(_ segmentedIndex: Int) {
        segmentedControl.selectedSegmentIndex = segmentedIndex
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSegmentedControl()
        addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addActions() {
        segmentedControl.addTarget(self, action: #selector(handleChange), for: .valueChanged)
    }
    
    @objc func handleChange() {
        delegate?.segmentedTapped(segmentedControl.selectedSegmentIndex)
    }
}
