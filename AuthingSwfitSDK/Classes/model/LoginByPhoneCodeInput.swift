//
//  LoginByPhoneCodeInput.swift
//  test
//
//  Created by iandtop on 2020/10/27.
//

import Foundation

public class LoginByPhoneCodeInput {
    public  var phone: String
 
    public var code: String
 
    public var autoRegister: Bool? = nil
 
    public var clientIp: String? = nil
    
    public init(phone:String,code:String){
        self.phone = phone
        self.code = code
    }
}
