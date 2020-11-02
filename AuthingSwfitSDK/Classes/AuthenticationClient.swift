import Foundation
import Alamofire
import SwiftyRSA

public class AuthenticationClient {
    public let host:String  = "https://core.authing.cn";
    public let publicKeyStr:String = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC4xKeUgQ+Aoz7TLfAfs9+paePb" +
        "5KIofVthEopwrXFkp8OCeocaTHt9ICjTT2QeJh6cZaDaArfZ873GPUn00eOIZ7Ae" +
        "+TiA2BKHbCvloW3w5Lnqm70iSsUi5Fmu9/2+68GZRH9L7Mlh8cFksCicW2Y2W2uM" +
        "GKl64GDcIq3au+aqJQIDAQAB";
    public let accessToken:String = "";
    
    public var userPoolId = "";
    public let sdkType = "SDK";
    public let sdkVersion = "java:3.0.1";
    
    public let graphQLEndpoint:String
    
    public var commonHeaders:HTTPHeaders{[
        "Authorization":"Bearer ",
        "Content-Type":"application/json",
        "x-authing-userpool-id": userPoolId,
        "x-authing-request-from": sdkType,
        "x-authing-sdk-version": sdkVersion
    ]}
    
    public init(userPoolId:String){
        self.userPoolId = userPoolId
        self.graphQLEndpoint = host + "/graphql/v2";
    }
 
    public func loginByUsername(input: LoginByUsernameInput,completion: @escaping (Result<Data,Error>)->Void) -> DataRequest {
        let pwd = CommonUtil.shared.encrpt(msg: input.password, publicKeyBase64: publicKeyStr)
//        let input:LoginByUsernameInput =  LoginByUsernameInput(username: username, password: pwd)
//        let param:LoginByUsernameParam =  LoginByUsernameParam(input: input)
//        let requestParam:LoginByUsernameRequestParam =  LoginByUsernameRequestParam(variables: param)


        return AF.request(self.graphQLEndpoint,
                   method: .post,
                   parameters: [
                    "variables": [
                        "input": [
                            "username": input.username,
                            "password": pwd,
                            "captchaCode": input.captchaCode as Any,
                            "autoRegister": input.autoRegister as Any,
                            "clientIp": input.clientIp as Any
                        ],
                        "loginByUsernameDocument":GraphQLV2.LoginByUsernameDocument
                    ],
                    "query": GraphQLV2.LoginByUsernameDocument
                   ],
                   encoding:JSONEncoding.prettyPrinted,
                   headers: commonHeaders)
            .responseData {response in
                switch response.result {
                case let .success(data):
                    completion(.success(data))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }
   
    public func loginByPhoneCode (input: LoginByPhoneCodeInput,completion: @escaping (Result<Data,Error>)->Void) -> DataRequest {
        return AF.request(self.graphQLEndpoint,
                   method: .post,
                   parameters: [
                    "variables": [
                        "input": [
                            "phone": input.phone,
                            "code": input.code,
                            "autoRegister": input.autoRegister as Any,
                            "clientIp": input.clientIp as Any
                        ],
                        "loginByPhoneCodeDocument":GraphQLV2.LoginByPhoneCodeDocument
                    ],
                    "query": GraphQLV2.LoginByPhoneCodeDocument
                   ],
                   encoding:JSONEncoding.prettyPrinted,
                   headers: commonHeaders)
            .responseData {response in
                switch response.result {
                case let .success(data):
                    completion(.success(data))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }
    
    public func sendSmsCode(phone:String,completion: @escaping (Result<Data,Error>)->Void) -> DataRequest {
        let endpoint = host + "/api/v2/sms/send";
    
        return AF.request(endpoint,
                   method: .post,
                   parameters: [
                    "phone": phone
                   ],
                   encoding:JSONEncoding.prettyPrinted,
                   headers: commonHeaders)
            .responseData {response in
                switch response.result {
                case let .success(data):
                    completion(.success(data))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }
    
    public func registerByUsername(input: RegisterByUsernameInput,completion: @escaping (Result<Data,Error>)->Void) -> DataRequest {
        let pwd = CommonUtil.shared.encrpt(msg: input.password, publicKeyBase64: publicKeyStr)
//        let input:LoginByUsernameInput =  LoginByUsernameInput(username: username, password: pwd)
//        let param:LoginByUsernameParam =  LoginByUsernameParam(input: input)
//        let requestParam:LoginByUsernameRequestParam =  LoginByUsernameRequestParam(variables: param)
    
        var udfs = [[String:String]]()
        if input.profile?.udf != nil {
            for item in input.profile!.udf! {
                udfs.append(["key":item.key,"value":item.value])
            }
        }
        
        var profile = [String:Any]()
        if input.profile != nil {
            profile = [
                "ip": input.profile?.ip as Any,
                "oauth": input.profile?.oauth as Any,
                "nickname": input.profile?.nickname as Any,
                "company": input.profile?.company as Any,
                "photo": input.profile?.photo as Any,
                "device": input.profile?.device as Any,
                "browser": input.profile?.browser as Any,
                "name": input.profile?.name as Any,
                "givenName": input.profile?.givenName as Any,
                "familyName": input.profile?.familyName as Any,
                "middleName": input.profile?.middleName as Any,
                "profile": input.profile?.profile as Any,
                "preferredUsername": input.profile?.preferredUsername as Any,
                "website": input.profile?.website as Any,
                "gender": input.profile?.gender as Any,
                "birthdate": input.profile?.birthdate as Any,
                "zoneinfo": input.profile?.zoneinfo as Any,
                "locale": input.profile?.locale as Any,
                "address": input.profile?.address as Any,
                "formatted": input.profile?.formatted as Any,
                "streetAddress": input.profile?.streetAddress as Any,
                "locality": input.profile?.locality as Any,
                "region": input.profile?.region as Any,
                "postalCode": input.profile?.postalCode as Any,
                "country": input.profile?.postalCode as Any,
                "udf": udfs
            ]
        }
        
        return AF.request(self.graphQLEndpoint,
                   method: .post,
                   parameters: [
                    "variables": [
                        "input": [
                            "username": input.username,
                            "password": pwd,
                            "generateToken": input.generateToken as Any,
                            "forceLogin": input.forceLogin as Any,
                            "clientIp": input.clientIp as Any,
                            "profile": profile
                        ],
                        "registerByUsernameDocument":GraphQLV2.RegisterByUsernameDocument
                    ],
                    "query": GraphQLV2.RegisterByUsernameDocument
                   ],
                   encoding:JSONEncoding.prettyPrinted,
                   headers: commonHeaders)
            .responseData {response in
                switch response.result {
                case let .success(data):
                    completion(.success(data))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }
    
    public func logout(completion: @escaping (Result<Data,Error>)->Void) -> DataRequest {
        return AF.request(self.graphQLEndpoint,
                   method: .post,
                   parameters: [
                    "variables": [
                        "input": [
                            "tokenExpiredAt": "0"
                        ],
                        "updateUserDocument":GraphQLV2.UpdateUserDocument
                    ],
                    "query": GraphQLV2.UpdateUserDocument
                   ],
                   encoding:JSONEncoding.prettyPrinted,
                   headers: commonHeaders)
            .responseData {response in
                switch response.result {
                case let .success(data):
                    completion(.success(data))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
        
    }
}
