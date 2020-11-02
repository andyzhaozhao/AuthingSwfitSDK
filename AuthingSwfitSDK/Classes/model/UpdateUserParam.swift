//
//  UpdateUserParam.swift
//  test
//
//  Created by iandtop on 2020/10/27.
//

import Foundation

public class UpdateUserParam {
    public var id: String? = nil
       
    public var input: UpdateUserInput
    
    public init(input: UpdateUserInput){
        self.input = input
    }
}
