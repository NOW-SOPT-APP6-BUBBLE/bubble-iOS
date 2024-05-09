//
//  BaseModel.swift
//  Bubble
//
//  Created by 서은수 on 5/9/24.
//

import Foundation

// MARK: - 서버가 만들어주는 것에 따라 언제든 수정될 수 있음
/// 일단 가장 자주 쓰이는 모델로 넣어둠
struct BaseModel<T: Codable>: Codable {
    let code: Int
    let message: String
    let data: T
}

/// data가 비었을 경우에 사용
struct EmptyDataModel: Codable {
    let code: Int
    let message: String
    let data: [String: String]?
}
