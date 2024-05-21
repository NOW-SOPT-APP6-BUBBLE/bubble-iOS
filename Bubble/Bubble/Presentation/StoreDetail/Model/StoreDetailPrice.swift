//
//  StoreDetailPrice.swift
//  Bubble
//
//  Created by 심서현 on 5/19/24.
//

import Foundation

struct StoreDetailPrice {
    let count: String
    let originPrice: String
    let currentPrice: String
}

func getStoreDetailStoreDetailPrice() -> [StoreDetailPrice] {
    return [
        StoreDetailPrice(count: "1인권", originPrice: "", currentPrice: "￦4,500"),
        StoreDetailPrice(count: "2인권", originPrice: "￦9,000", currentPrice: "￦8,000"),
        StoreDetailPrice(count: "3인권", originPrice: "￦13,500", currentPrice: "￦11,500"),
        StoreDetailPrice(count: "4인권", originPrice: "￦18,000", currentPrice: "￦15,000"),
        StoreDetailPrice(count: "5인권", originPrice: "￦22,500", currentPrice: "￦18,500"),
        StoreDetailPrice(count: "6인권", originPrice: "￦27,000", currentPrice: "￦22,000"),
        StoreDetailPrice(count: "7인권", originPrice: "￦31,500", currentPrice: "￦25,000"),
        StoreDetailPrice(count: "8인권", originPrice: "￦36,000", currentPrice: "￦29,000"),
        StoreDetailPrice(count: "9인권", originPrice: "￦40,500", currentPrice: "￦33,000"),
    ]
}
