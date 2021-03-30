//
//  UserInfomation.swift
//  SignUp
//
//  Created by 김민창 on 2021/03/30.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var name: String?
    var age: String?
}
