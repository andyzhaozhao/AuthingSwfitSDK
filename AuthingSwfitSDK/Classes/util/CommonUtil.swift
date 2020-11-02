//
//  CommonUtil.swift
//  test
//
//  Created by iandtop on 2020/10/27.
//

import Foundation
import Alamofire
import SwiftyRSA

public class CommonUtil {
    public static let shared = CommonUtil()
    private init(){}
    
    public func encrpt(msg:String,publicKeyBase64:String)->(String){
        do{
            let publicKey = try PublicKey(base64Encoded: publicKeyBase64)
            let clear = try ClearMessage(string: msg, using: .utf8)
            let encrypted = try clear.encrypted(with: publicKey, padding: .PKCS1)

            let base64String = encrypted.base64String
            return base64String
        }catch let error{
            debugPrint(error)
            return ""
        }
    }
}
