//
//  LoginByUsernameInput.swift
//  test
//
//  Created by iandtop on 2020/10/24.
//

import Foundation


public struct LoginByUsernameInput {
    public var username: String
    public var password: String
    public var captchaCode: String? = nil
    public var autoRegister: Bool? = nil
    public var clientIp: String? = nil
    
    public init(username:String,password:String){
        self.username = username
        self.password = password
    }
}
