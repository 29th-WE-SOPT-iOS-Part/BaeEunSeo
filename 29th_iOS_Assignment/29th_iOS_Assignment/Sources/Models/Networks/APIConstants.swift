//
//  APIConstants.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/11/05.
//

import Alamofire

enum APIConstants {
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    case login
    case signUp
    
    var path: String {
        switch self {
        case .login:
            return APIConstants.baseURL + "/user/login"
        case .signUp:
            return APIConstants.baseURL + "/user/signup"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login, .signUp:
            return .post
        }
    }
    
    var header: HTTPHeaders {
        switch self {
        case .login, .signUp:
            return [ "Content-Type" : "application/json" ]
        }
    }
}
