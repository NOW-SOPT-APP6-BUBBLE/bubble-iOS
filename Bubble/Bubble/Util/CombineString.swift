//
//  CombineString.swift
//  Bubble
//
//  Created by 심서현 on 5/22/24.
//

import Foundation

/// [String] 배열을 ' , ' 로 연결하는 함수입니다.
/// ["감자", "사과", "배] 라는 배열이 있으면, [ 감자, 사과, 배 ] 라는 문자열로 출력됩니다.
func combineStrings(_ strings: [String]) -> String {
    print(strings.joined(separator: ", "))
    return strings.joined(separator: ", ")
}
