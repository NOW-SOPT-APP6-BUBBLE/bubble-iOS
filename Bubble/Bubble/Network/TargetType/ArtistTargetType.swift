//
//  ArtistTargetType.swift
//  Bubble
//
//  Created by 서은수 on 5/21/24.
//

import Foundation

import Moya

enum ArtistTargetType {
    case fetchArtistList(memberId: String)
}

extension ArtistTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Secret.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchArtistList:
            return "/api/vi/artists/artist-members"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchArtistList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchArtistList:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .fetchArtistList(let memberId):
            return ["Content-Type": "application/json",
                    "memberId": memberId]
        }
    }
}
