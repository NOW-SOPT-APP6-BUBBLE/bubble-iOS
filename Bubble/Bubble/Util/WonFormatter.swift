//
//  WonFormatter.swift
//  Bubble
//
//  Created by 심서현 on 5/22/24.
//

import Foundation

/// 정수를 ₩과 슬라이싱해서 보여줍니다.
///  7000 -> ₩7,000
func wonFormatter(_ num: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencySymbol = "₩"
    formatter.maximumFractionDigits = 0
    return formatter.string(from: NSNumber(value: num)) ?? ""
}
