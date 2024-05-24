//
//  ArtistListModel.swift
//  Bubble
//
//  Created by 서은수 on 5/21/24.
//

import Foundation

struct ArtistListResult: Codable {
    var isSubsArtists: [ArtistListModel]
    var isNotSubsArtists: [ArtistListModel]
}

struct ArtistListModel: Codable {
    var artistMemberId: Int
    var name: String
    var imageURL: String
    var introduction: String?
}

struct ArtistListCellData {
    var isExpanded: Bool
    var dataModel: [ArtistListModel]
    
    init(isExpanded: Bool = true, dataModel: [ArtistListModel] = []) {
        self.isExpanded = isExpanded
        self.dataModel = dataModel
    }
}
