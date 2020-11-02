//
//  LoginByUsernameRequestParam.swift
//  test
//
//  Created by iandtop on 2020/10/24.
//

import Foundation

public struct LoginByUsernameRequestParam {
    public  var variables: LoginByUsernameParam
    public var query: String = GraphQLV2.LoginByUsernameDocument
    
    public init(variables:LoginByUsernameParam){
        self.variables = variables
    }
}
