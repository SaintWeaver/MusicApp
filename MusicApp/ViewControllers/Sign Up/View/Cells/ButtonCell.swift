//
//  ButtonCell.swift
//  MusicApp
//
//  Created by Maksom Kolbas on 16.11.2021.
//

import UIKit



class ButtonCell: UITableViewCell {
    
    override var reuseIdentifier: String? {
        return String(describing: ButtonCell.self)
    }

    var buttonType: ButtonType = .login
    var oneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        contentView.addSubview(oneButton)
        oneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            oneButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            oneButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            oneButton.leadingAnchor.constraint(lessThanOrEqualTo: contentView.leadingAnchor, constant: 100),
            oneButton.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -100),
            oneButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    func setButtonTitle(_ type: ButtonType) {
        buttonType = type
        oneButton.setTitle(type.setTitle, for: .normal)
    }
}
