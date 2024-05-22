//
//  StoreDetailModel.swift
//  Bubble
//
//  Created by 심서현 on 5/22/24.
//

import Foundation

// MARK: - Result

struct StoreDetailResult: Codable {
    let artist: StoreDetailArtist
}

// MARK: - Artist

struct StoreDetailArtist: Codable {
    let name, description, photo: String
    let subscribe: [StoreDetailSubscribe]
    let isServiceMembers, isNotServiceMembers: [String]
}

// MARK: - Subscribe

struct StoreDetailSubscribe: Codable {
    let name: String
    let price: Int
}
