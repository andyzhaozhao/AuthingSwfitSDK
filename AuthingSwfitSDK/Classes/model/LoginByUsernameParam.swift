//
//  LoginByUsernameParam.swift
//  test
//
//  Created by iandtop on 2020/10/24.
//
import Foundation


public struct LoginByUsernameParam {
    public var input: LoginByUsernameInput
    public var loginByUsernameDocument: String = GraphQLV2.LoginByUsernameDocument
    
    public init(input:LoginByUsernameInput){
        self.input = input
    }
}
