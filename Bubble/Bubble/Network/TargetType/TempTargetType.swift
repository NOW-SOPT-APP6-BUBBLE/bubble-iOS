//
//  TempTargetType.swift
//  Bubble
//
//  Created by 서은수 on 5/10/24.
//

import Foundation

import Moya

enum TempTargetType {
    case getExample(number: Int)
}

extension TempTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Secret.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getExample(let number):
            return "/example/\(number)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getExample:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getExample:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getExample:
            return ["Content-Type": "application/json"]
        }
    }
}
