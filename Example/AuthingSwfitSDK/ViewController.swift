//
//  ViewController.swift
//  AuthingSwfitSDK
//
//  Created by andy_zhaozhao@hotmail.com on 11/01/2020.
//  Copyright (c) 2020 andy_zhaozhao@hotmail.com. All rights reserved.
//

import UIKit
import AuthingSwfitSDK

class ViewController: UIViewController {

    let authenticationClient = AuthenticationClient(userPoolId: "5f8d2827feaa6e31598fda94")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let input:LoginByUsernameInput=LoginByUsernameInput(username: "test", password: "test")
        self.authenticationClient.loginByUsername(input: input){ result in
            switch result {
            case let .success(data):
                print("get code \(data)")
            case let .failure(error):
                print("get code \(error)")
            }
        }
        
//        self.authenticationClient.logout()
        
//                    let rinput:RegisterByUsernameInput=RegisterByUsernameInput(username: "test2", password: "test2")
//                    self.authenticationClient.registerByUsername(input: rinput)
        
//                    self.authenticationClient.sendSmsCode(phone: "18311302182")
//                    let code="1955"
//                    let lBPC:LoginByPhoneCodeInput = LoginByPhoneCodeInput(phone:"18311302182",code:code)
//                    self.authenticationClient.loginByPhoneCode(input: lBPC)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

