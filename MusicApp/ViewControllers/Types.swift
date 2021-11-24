//
//  TextFieldDataType.swift
//  MusicApp
//
//  Created by George Weaver on 17.11.2021.
//

import Foundation
    
enum TextFieldCellType: Int {
    case login
    case email
    case password
    case repeatPassword
    
    var placeholder: String {
        switch self {
        case .login:
            return "Login"
        case .email:
            return "Email"
        case .password:
            return "Password"
        case .repeatPassword:
            return "RepeatPassword"
        }
    }
}

enum ScreenType {
    case login
    case signUp
}

enum ButtonType {
    case login
    case signUp
    
    var setTitle: String {
        switch self {
        case .login:
            return "Login"
        case .signUp:
            return "Sign Up"
        }
    }
}
