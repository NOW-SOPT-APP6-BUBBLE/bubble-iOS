//
//  ArtistsTargetType.swift
//  Bubble
//
//  Created by 심서현 on 5/22/24.
//

import Foundation

import Moya

enum ArtistsTargetType {
    case getStoreDetail(memberId: String ,artistId: String)
}

extension ArtistsTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Secret.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getStoreDetail(let memberId, let artistId):
            return "/api/v1/artists/\(artistId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getStoreDetail(artistId: let artistId):
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getStoreDetail:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getStoreDetail(memberId: let memberId, artistId: let artistId):
            return ["Content-Type": "application/json","memberId": memberId]
        }
    }
}
