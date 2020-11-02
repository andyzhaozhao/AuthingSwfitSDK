//
//  GraphQLV2.swift
//  test
//
//  Created by iandtop on 2020/10/24.
//

import Foundation

public struct GraphQLV2 {
    public static let LoginByUsernameDocument = """
mutation loginByUsername($input: LoginByUsernameInput!) {
    loginByUsername(input: $input) {
        id
        arn
        userPoolId
        username
        email
        emailVerified
        phone
        phoneVerified
        unionid
        openid
        nickname
        registerSource
        photo
        password
        oauth
        token
        tokenExpiredAt
        loginsCount
        lastLogin
        lastIP
        signedUp
        blocked
        isDeleted
        device
        browser
        company
        name
        givenName
        familyName
        middleName
        profile
        preferredUsername
        website
        gender
        birthdate
        zoneinfo
        locale
        address
        formatted
        streetAddress
        locality
        region
        postalCode
        city
        province
        country
        createdAt
        updatedAt
    }
}
""";

    public static let RegisterByUsernameDocument: String = """
mutation registerByUsername($input: RegisterByUsernameInput!) {
 registerByUsername(input: $input) {
   id
   arn
   userPoolId
   username
   email
   emailVerified
   phone
   phoneVerified
   unionid
   openid
   nickname
   registerSource
   photo
   password
   oauth
   token
   tokenExpiredAt
   loginsCount
   lastLogin
   lastIP
   signedUp
   blocked
   isDeleted
   device
   browser
   company
   name
   givenName
   familyName
   middleName
   profile
   preferredUsername
   website
   gender
   birthdate
   zoneinfo
   locale
   address
   formatted
   streetAddress
   locality
   region
   postalCode
   city
   province
   country
   createdAt
   updatedAt
 }
}
"""

    public static let LoginByPhoneCodeDocument: String = """
mutation loginByPhoneCode($input: LoginByPhoneCodeInput!) {
  loginByPhoneCode(input: $input) {
    id
    arn
    userPoolId
    username
    email
    emailVerified
    phone
    phoneVerified
    unionid
    openid
    nickname
    registerSource
    photo
    password
    oauth
    token
    tokenExpiredAt
    loginsCount
    lastLogin
    lastIP
    signedUp
    blocked
    isDeleted
    device
    browser
    company
    name
    givenName
    familyName
    middleName
    profile
    preferredUsername
    website
    gender
    birthdate
    zoneinfo
    locale
    address
    formatted
    streetAddress
    locality
    region
    postalCode
    city
    province
    country
    createdAt
    updatedAt
  }
}
"""
    
    
    public static let UpdateUserDocument: String = """
mutation updateUser($id: String, $input: UpdateUserInput!) {
  updateUser(id: $id, input: $input) {
    id
    arn
    userPoolId
    username
    email
    emailVerified
    phone
    phoneVerified
    unionid
    openid
    nickname
    registerSource
    photo
    password
    oauth
    token
    tokenExpiredAt
    loginsCount
    lastLogin
    lastIP
    signedUp
    blocked
    isDeleted
    device
    browser
    company
    name
    givenName
    familyName
    middleName
    profile
    preferredUsername
    website
    gender
    birthdate
    zoneinfo
    locale
    address
    formatted
    streetAddress
    locality
    region
    postalCode
    city
    province
    country
    createdAt
    updatedAt
  }
}
"""
}

