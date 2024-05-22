//
//  ArtistService.swift
//  Bubble
//
//  Created by 서은수 on 5/21/24.
//

import Foundation

import Moya

final class ArtistMembersService {
    static let shared = ArtistMembersService()
    private var artistMemberProvider = MoyaProvider<ArtistMembersTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension ArtistMembersService {
    func fetchArtistList(memberId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        artistMemberProvider.request(.fetchArtistList(memberId: memberId)) { result in
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
    
    func fetchArtistProfile(
        request: ArtistProfileRequest,
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        artistMemberProvider.request(.fetchArtistProfile(request: request)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, BaseModel<ArtistProfileResult>.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }

    func deleteArtistSubs(
        memberId: String, artistMemberId: Int,
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        artistMemberProvider.request(
            .deleteArtistSubs(memberId: memberId, artistMemberId: artistMemberId)) { result in
            switch result {
            case .success(let response):
                print(response)
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, EmptyResultModel.self)
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
            return .decodingError
        }
        return .success(decodedData as Any)
    }
}
