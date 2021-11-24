//
//  SwitchCell.swift
//  MusicApp
//
//  Created by Maksom Kolbas on 16.11.2021.
//

import UIKit

class SwitchCell: UITableViewCell {

    override var reuseIdentifier: String? {
        return String(describing: SwitchCell.self)
    }
    
    var someLabel: UILabel = {
        let label = UILabel()
        label.text = "Согласен с правилами"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var someSwitch: UISwitch = {
        let oneSwitch = UISwitch()
        oneSwitch.isOn = true
        return oneSwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellAppearance()
        setupSwitchWithLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellAppearance() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func setupSwitchWithLabel() {
        contentView.addSubview(someSwitch)
        contentView.addSubview(someLabel)
        someSwitch.translatesAutoresizingMaskIntoConstraints = false
        someLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            someSwitch.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            someSwitch.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            someSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            someLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            someLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            someLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            someLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}
