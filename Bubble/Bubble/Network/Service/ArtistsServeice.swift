//
//  ArtistsServeice.swift
//  Bubble
//
//  Created by 심서현 on 5/22/24.
//

import Foundation

import Moya

final class ArtistsServeice {
    static let shared = ArtistsServeice()
    private var artistsProvider = MoyaProvider<ArtistsTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension ArtistsServeice {
    func getStoreDetail(memberId: String, artistId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        artistsProvider.request(.getStoreDetail(memberId: memberId, artistId: artistId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, BaseModel<StoreDetailResult>.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func getStore(memberId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
            artistsProvider.request(.getStore(memberId: memberId)) { result in
                switch result {
                case .success(let response):
                    let statusCode = response.statusCode
                    let data = response.data
                    let networkResult = self.judgeStatus(by: statusCode, data, BaseModel<StoreResult>.self)
                    completion(networkResult)
                case .failure:
                    completion(.networkFail)
                }
            }
        }

        private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
            switch statusCode {
            case 200..<330:
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
                return .pathError
            }
            return .success(decodedData as Any)
        }
    }
