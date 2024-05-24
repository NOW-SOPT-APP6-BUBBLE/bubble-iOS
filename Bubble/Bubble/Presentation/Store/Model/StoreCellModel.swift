//
//  StoreCellModel.swift
//  Bubble
//
//  Created by Chandrala on 5/21/24.
//

// MARK: - Result

struct StoreResult: Codable {
    let artists: [StoreArtist]
}

// MARK: - Artist

struct StoreArtist: Codable {
    let name, photo: String
    let artistId: Int
}
