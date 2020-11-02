//
//  RegisterByUsernameInput.swift
//  test
//
//  Created by iandtop on 2020/10/27.
//

import Foundation

public class RegisterByUsernameInput {
    public var username: String

    public  var password: String

    public var profile: RegisterProfileInput? = nil

    public var forceLogin: Bool? = nil

    public var generateToken: Bool? = nil

    public var clientIp: String? = nil
    
    public  init(username:String,password:String){
        self.username = username
        self.password = password
    }
}
