//
//  StoreDetailPriceListStackView.swift
//  Bubble
//
//  Created by 심서현 on 5/19/24.
//

import UIKit

struct PriceData {
    let count: String
    let originPrice: String
    let currentPrice: String
}

final class StoreDetailPriceListStackView: UIStackView {
    // MARK: - Property
    let priceData: [PriceData] = [
        PriceData(count: "1인권", originPrice: "", currentPrice: "￦8,000"),
        PriceData(count: "2인권", originPrice: "￦10,000", currentPrice: "￦9,000"),
    ]
    
    // MARK: - Component
    
    private func createPriceCard(count: String, originPrice: String, currentPrice: String) -> UIStackView {
        let countLabel = UILabel().then {
            $0.attributedText = UILabel.createAttributedText(for: .name4, withText: count, color: .white)
        }
        
        let originPriceLabel = UILabel().then {
            $0.attributedText = UILabel.createAttributedText(for: .body2, withText: originPrice, color: .gray500)
            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        
        let currentPriceLabel = UILabel().then {
            $0.attributedText = UILabel.createAttributedText(for: .name3, withText: currentPrice, color: .white)
            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        
        let perLabel = UILabel().then {
            $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "/월", color: .gray500)
            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }

        let stackView = UIStackView(arrangedSubviews: [countLabel, originPriceLabel, currentPriceLabel, perLabel]).then {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 5
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .gray800
            $0.isLayoutMarginsRelativeArrangement = true
            $0.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 21, leading: 12, bottom: 21, trailing: 12)

        }
        
        return stackView
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    func setLayout() {
        self.axis = .vertical
        self.spacing = 12
        addArrangedSubviews(createPriceList())
        print(self.subviews[0].subviews)
        print(self.subviews[1].subviews)
    }

    // MARK: - Helpers
    func createPriceList() -> [UIStackView] {
        return priceData.map { item in
            createPriceCard(count: item.count, originPrice: item.originPrice, currentPrice: item.currentPrice)
        }
    }
    
    // MARK: - Action
    
}
// MARK: - Extension

// MARK: - ___ Delegate
