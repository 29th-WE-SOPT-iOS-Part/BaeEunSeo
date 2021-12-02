//
//  UserSignService.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/11/05.
//

import Foundation
import Alamofire
import UIKit

struct UserSignService {
    static let shared = UserSignService()
    
    func signUp(email: String,
                name: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        let body: Parameters = [
            "email" : email,
            "name" : name,
            "password" : password
        ]
        let dataRequest = AF.request(APIConstants.signUp.path,
                                     method: APIConstants.signUp.httpMethod,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: APIConstants.signUp.header)
        
        responseData(dataRequest, completion)
    }
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void) {
        let body: Parameters = [
            "email" : email,
            "password" : password
        ]
        let dataRequest = AF.request(APIConstants.login.path,
                                     method: APIConstants.signUp.httpMethod,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: APIConstants.login.header)
        
        responseData(dataRequest, completion)
    }
    
    private func responseData(_ dataRequest: DataRequest, _ completion: @escaping (NetworkResult<Any>) -> Void) {
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let error):
                print(error)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        guard let decodedData = try? JSONDecoder().decode(SignResponse.self, from: data)
        else { return .pathError }
        
        switch statusCode {
        case 200: return .success(decodedData)
        case 400: return .requestError(decodedData.message)
        case 500: return .serverError(decodedData.message)
        default: return .networkFail
        }
    }
}
