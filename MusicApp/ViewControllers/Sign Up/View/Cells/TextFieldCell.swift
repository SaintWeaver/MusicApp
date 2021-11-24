//
//  TextInputCell.swift
//  MusicApp
//
//  Created by Maksom Kolbas on 16.11.2021.
//

import UIKit

class TextFieldCell: UITableViewCell {
    
    override var reuseIdentifier: String? {
        return String(describing: TextFieldCell.self)
    }
    
    var cellType: TextFieldCellType = .login

    var textField: UITextField = {
        let login = UITextField()
        login.backgroundColor = .white
        login.borderStyle = .roundedRect
        login.clipsToBounds = true
        login.autocapitalizationType = .none
        login.layer.borderColor = UIColor.clear.cgColor
        return login
    }()
    
    func setupTextField() {
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
    }
    
    func configure(_ type: TextFieldCellType) {
        cellType = type
        textField.placeholder = type.placeholder
    }
    
    func customInit(_ text: String) {
        textField.placeholder = text
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
