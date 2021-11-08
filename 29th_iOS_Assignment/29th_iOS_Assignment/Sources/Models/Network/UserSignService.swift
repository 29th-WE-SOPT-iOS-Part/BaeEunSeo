//
//  UserSignService.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/11/05.
//

import Foundation
import Alamofire

struct UserSignService {
    static let shared = UserSignService()
    
    func signUp(email: String,
                name: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        let body: Parameters = [
            "email" : email,
            "name" : name,
            "password" : password
        ]
        let dataRequest = AF.request(APIConstants.signUpURL,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        responseData(dataRequest, completion)
    }
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        let body: Parameters = [
            "email" : email,
            "password" : password
        ]
        let dataRequest = AF.request(APIConstants.loginURL,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
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
        switch statusCode {
        case 200: return isVaildLoginData(data: data)
        case 400: return .pathError
        case 500: return .serverError
        default: return .networkFail
        }
    }
    
    private func isVaildLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignResponse.self, from: data)
        else { return .pathError }
        return .success(decodedData)
    }
}
