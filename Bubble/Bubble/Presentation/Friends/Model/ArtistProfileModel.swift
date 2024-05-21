//
//  ArtistProfileModel.swift
//  Bubble
//
//  Created by 서은수 on 5/21/24.
//

import Foundation

struct ArtistProfileRequest: Codable {
    var memberId: String
    var artistMemberId: Int
}

struct ArtistProfileResult: Codable {
    var artistMemberId: Int
    var nickname: String
    var imageURL: String
    var introduction: String
    var isSubscribed: Bool
    var artistName: String?
    var artistMemberName: String
}

struct ArtistProfileModel {
    var nickname: String
    var imageURL: URL?
    var introduction: String
    var isSubscribed: Bool
    var artistName: String?
    var artistMemberName: String
}

extension ArtistProfileResult {
    func toArtistProfileModel() -> ArtistProfileModel {
        ArtistProfileModel(
            nickname: nickname,
            imageURL: URL(string: imageURL),
            introduction: introduction,
            isSubscribed: isSubscribed,
            artistName: artistName,
            artistMemberName: artistMemberName
        )
    }
}
