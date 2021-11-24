//
//  ViewModel.swift
//  MusicApp
//
//  Created by George Weaver on 23.11.2021.
//

import Foundation
import UIKit

class ViewModel: NSObject {
    
    var screenType: ScreenType = .signUp 
    
    lazy var data: [TextFieldCellType] = {
        switch screenType {
        case .login:
            return [.login, .password]
        case .signUp:
            return [.login, .email, .password, .repeatPassword]
        }
    }()

}

extension ViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextFieldCell.self)) as! TextFieldCell
            cell.configure(data[indexPath.row])
            return cell
    }
}

