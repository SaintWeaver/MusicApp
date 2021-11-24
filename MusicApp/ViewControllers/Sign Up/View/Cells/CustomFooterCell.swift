//
//  CustomFooterCell.swift
//  MusicApp
//
//  Created by George Weaver on 24.11.2021.
//

import UIKit

class CustomFooterCell: UITableViewCell {

    override var reuseIdentifier: String? {
        return String(describing: CustomFooterCell.self)
    }
    
    var footerType: ScreenType = .signUp
    
    var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Согласен с правилами"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var customSwitch: UISwitch = {
        let customSwitch = UISwitch()
        customSwitch.isOn = false
        return customSwitch
    }()
    
    var customButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        button.tintColor = .white
        return button
    }()
    
    func setupCustomFooterCell() {
        if footerType == .signUp {
            customButton.setTitle("Sign Up", for: .normal)
            
            contentView.addSubview(infoLabel)
            contentView.addSubview(customSwitch)
            contentView.addSubview(customButton)
            infoLabel.translatesAutoresizingMaskIntoConstraints = false
            customSwitch.translatesAutoresizingMaskIntoConstraints = false
            customButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                customSwitch.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
                customSwitch.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
                customSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
                infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
                infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                customButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
                customButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                customButton.leadingAnchor.constraint(lessThanOrEqualTo: contentView.leadingAnchor, constant: 100),
                customButton.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -100),
                customButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
            } else {
                customButton.setTitle("Login", for: .normal)
                contentView.addSubview(customButton)
                customButton.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    customButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
                    customButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
                    customButton.leadingAnchor.constraint(lessThanOrEqualTo: contentView.leadingAnchor, constant: 100),
                    customButton.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -100),
                    customButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
                ])
            }
        }
    
    func configure(_ type: ScreenType) {
        footerType = type
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCustomFooterCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
