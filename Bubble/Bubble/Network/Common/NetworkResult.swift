//
//  NetworkResult.swift
//  Bubble
//
//  Created by 서은수 on 5/9/24.
//

import Foundation

/// 네트워크 통신 중 예기치 못한 에러 발생 시 처리
enum NetworkResult<T> {
    case success(T)               // 서버 통신 성공
    case requestError             // 요청 에러 발생
    case decodingError            // 디코딩 오류 발생
    case pathError                // 경로 에러 발생
    case serverError              // 서버쪽 에러 발생
    case networkFail              // 네트워크 연결 실패
}
extension NetworkResult {
    func defineNetworkResult(_ res: NetworkResult, onSuccess: (T) -> Void) -> Void {
        switch self {
        case .success(let data):
            onSuccess(data)
            
        case .requestError:
            print("요청 오류 입니다")
        case .decodingError:
            print("디코딩 오류 입니다")
        case .pathError:
            print("경로 오류 입니다")
        case .serverError:
            print("서버 오류입니다")
        case .networkFail:
            print("네트워크 오류입니다")
        }
    }
}
