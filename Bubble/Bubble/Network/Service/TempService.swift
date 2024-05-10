//
//  TempService.swift
//  Bubble
//
//  Created by 서은수 on 5/10/24.
//

import Foundation

import Moya

final class TempService {
    static let shared = TempService()
    private var tempProvider = MoyaProvider<TempTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension TempService {
    func getExample(number: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        tempProvider.request(.getExample(number: number)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, BaseModel<TempModel>.self)
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
            return .pathError
        }
        return .success(decodedData as Any)
    }
}
