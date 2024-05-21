//
//  ArtistService.swift
//  Bubble
//
//  Created by 서은수 on 5/21/24.
//

import Foundation

import Moya

final class ArtistService {
    static let shared = ArtistService()
    private var artistProvider = MoyaProvider<ArtistTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension ArtistService {
    func fetchArtistList(memberId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        artistProvider.request(.fetchArtistList(memberId: memberId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, BaseModel<ArtistListResult>.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestError
        case 500:
            return .serverError
        default:
            return .networkFail
        }
    }
    
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self)에서 디코딩 오류가 발생했습니다 ⛔️")
            return .decodingError
        }
        return .success(decodedData as Any)
    }
}