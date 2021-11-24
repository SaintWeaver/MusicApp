//
//  ViewController.swift
//  MusicApp
//
//  Created by Maksom Kolbas on 15.11.2021.
//

import UIKit


class SignUpViewController: UIViewController {
    
    var tableView = UITableView()
    var viewModel = ViewModel()
    var selectedIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        setupHeaderView()
        setupDataSource()
    }
    
    func setupView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.delegate = self
    }
    
    func setupTableView() {
        tableView.backgroundColor = .white
        tableView.clipsToBounds = true
        tableView.register(CodeTableViewCell.self, forCellReuseIdentifier: "CodeTableViewCell")
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: String(describing: TextFieldCell.self))
        tableView.register(SegmentedControlCell.self, forCellReuseIdentifier: String(describing: SegmentedControlCell.self))
        tableView.separatorStyle = .none
    }
    
    func setupDataSource() {
        tableView.dataSource = viewModel
    }
    
    func setupHeaderView() {
        let header = SegmentedControlCell()
        header.delegate = self
        header.segmentedControl.selectedSegmentIndex = selectedIndex
        header.configure(selectedIndex)
        tableView.tableHeaderView = header
    }

}

extension SignUpViewController: SegmentedCellDelegate {
    func segmentedTapped(_ index: Int) {
        selectedIndex = index
        switch index {
        case 0:
            viewModel.screenType = .login
            viewModel.data = [.login, .password]
        case 1:
            viewModel.screenType = .signUp
            viewModel.data = [.login, .email, .password, .repeatPassword]
        default:
            return
        }
        tableView.reloadData()
    }
}

extension SignUpViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 80))

        let label = UILabel()
        label.text = "Согласен с правилами"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)

        let customSwitch = UISwitch()
        customSwitch.isOn = false

        let button = UIButton()
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        button.tintColor = .white

        if viewModel.screenType == .signUp {
            button.setTitle("Sign Up", for: .normal)

            footer.addSubview(label)
            footer.addSubview(customSwitch)
            footer.addSubview(button)
            label.translatesAutoresizingMaskIntoConstraints = false
            customSwitch.translatesAutoresizingMaskIntoConstraints = false
            button.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                customSwitch.topAnchor.constraint(equalTo: footer.topAnchor, constant: 4),
                customSwitch.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -4),
                customSwitch.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -20),

                label.topAnchor.constraint(equalTo: footer.topAnchor, constant: 4),
                label.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -40),
                label.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -20),

                button.topAnchor.constraint(equalTo: footer.topAnchor, constant: 40),
                button.bottomAnchor.constraint(equalTo: footer.bottomAnchor),
                button.leadingAnchor.constraint(lessThanOrEqualTo: footer.leadingAnchor, constant: 100),
                button.trailingAnchor.constraint(lessThanOrEqualTo: footer.trailingAnchor, constant: -100),
                button.centerXAnchor.constraint(equalTo: footer.centerXAnchor)
            ])
        } else {
            button.setTitle("Login", for: .normal)
            footer.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: footer.topAnchor, constant: 4),
                button.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -40),
                button.leadingAnchor.constraint(lessThanOrEqualTo: footer.leadingAnchor, constant: 100),
                button.trailingAnchor.constraint(lessThanOrEqualTo: footer.trailingAnchor, constant: -100),
                button.centerXAnchor.constraint(equalTo: footer.centerXAnchor)
            ])
        }
        return footer
    }
}


