//
//  NetworkResult.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/11/06.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestError(T)
    case pathError
    case serverError
    case networkFail
}
