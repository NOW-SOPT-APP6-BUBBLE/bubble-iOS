//
//  ArtistTargetType.swift
//  Bubble
//
//  Created by 서은수 on 5/21/24.
//

import Foundation

import Moya

enum ArtistMembersTargetType {
    case fetchArtistList(memberId: String)
    case fetchArtistProfile(request: ArtistProfileRequest)
    case deleteArtistSubs(memberId: String, artistMemberId: Int)
    case registerArtistSubs(memberId: String, artistMemberId: Int)
}

extension ArtistMembersTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Secret.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchArtistList:
            return "/api/v1/artists/artist-members"
        case .fetchArtistProfile(let request):
            return "/api/v1/artists/artist-members/\(request.artistMemberId)"
        case .deleteArtistSubs(_, artistMemberId: let artistMemberId):
            return "/api/v1/artists/artist-members/friend/\(artistMemberId)"
        case .registerArtistSubs(_, artistMemberId: let artistMemberId):
            return "/api/v1/artists/artist-members/friend/\(artistMemberId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchArtistList, .fetchArtistProfile:
            return .get
        case .deleteArtistSubs:
            return .delete
        case .registerArtistSubs:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchArtistList, .fetchArtistProfile, .deleteArtistSubs, .registerArtistSubs:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .fetchArtistList(let memberId):
            return ["Content-Type": "application/json",
                    "memberId": memberId]
        case .fetchArtistProfile(let request):
            return ["Content-Type": "application/json",
                    "memberId": request.memberId]
        case .deleteArtistSubs(memberId: let memberId, artistMemberId: _):
            return ["Content-Type": "application/json",
                    "memberId": memberId]
        case .registerArtistSubs(memberId: let memberId, artistMemberId: _):
            return ["memberId": memberId]
        }
    }
}
