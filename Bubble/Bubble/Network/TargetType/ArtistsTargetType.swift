//
//  ArtistsTargetType.swift
//  Bubble
//
//  Created by 심서현 on 5/22/24.
//

import Foundation

import Moya

enum ArtistsTargetType {
    case getStoreDetail(memberId: String, artistId: Int)
    case getStore(memberId: String)
}

extension ArtistsTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Secret.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getStoreDetail(_, let artistId):
            return "/api/v1/artists/\(artistId)"
        case .getStore(memberId: let memberId):
            return "/api/v1/artists"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getStoreDetail:
            return .get
        case .getStore(memberId: let memberId):
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getStoreDetail:
            return .requestPlain
        case .getStore(memberId: let memberId):
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getStoreDetail(memberId: let memberId, artistId: _):
            return ["Content-Type": "application/json", "memberId": memberId]
        case .getStore(memberId: let memberId):
            return ["Content-Type": "application/json", "memberId": memberId]
        }
    }
}
