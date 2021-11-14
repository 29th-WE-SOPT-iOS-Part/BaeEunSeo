//
//  SignResponse.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/11/05.
//

struct SignResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignResult?
}
