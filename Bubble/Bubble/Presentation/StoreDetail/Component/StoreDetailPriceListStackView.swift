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
        PriceData(count: "3인권", originPrice: "￦15,000", currentPrice: "￦13,000"),
        PriceData(count: "4인권", originPrice: "￦20,000", currentPrice: "￦18,000"),
    ]
    
    // MARK: - Component
    
    private let moreButton = UIButton().then {
        if let attributedTitle = UILabel.createAttributedText(for: .body1, withText: "더보기", color: .white) {
            $0.setAttributedTitle(attributedTitle, for: .normal)
            }
        
        let topLine = UIView()
        topLine.backgroundColor = .gray800
        
        $0.addSubview(topLine)
        
        $0.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        
        topLine.snp.makeConstraints {
            $0.top.width.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    private let bottomSpacing = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
    
    private func createPriceCard(count: String, originPrice: String, currentPrice: String, index: Int) -> UIStackView {
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

        let stackView = UIStackView(
            arrangedSubviews: [countLabel, originPriceLabel, currentPriceLabel, perLabel]
        ).then {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 5
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .gray800
            $0.isLayoutMarginsRelativeArrangement = true
            $0.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 21, leading: 12, bottom: 21, trailing: 12)
            
            // 4(index:3)번째부터 숨김
            $0.isHidden = index > 2
        }
        
        return stackView
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setTarget()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    func setLayout() {
        self.axis = .vertical
        self.spacing = 12
        self.addArrangedSubviews(createPriceList())
        self.addArrangedSubviews(bottomSpacing, moreButton)
    }
    
    func createPriceList() -> [UIStackView] {
        return priceData.enumerated().map { index, item in
            createPriceCard(
                count: item.count,
                originPrice: item.originPrice, currentPrice: item.currentPrice,
                index: index)
        }
    }

    // MARK: - Helpers
    func setTarget() {
        moreButton.addTarget(self, action: #selector(moreButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Action
    @objc private func moreButtonDidTap() {
        for case let stackView as UIStackView in self.arrangedSubviews {
            stackView.isHidden = false
        }
        moreButton.isHidden = true
        bottomSpacing.isHidden = false
    }
    
}
// MARK: - Extension

// MARK: - ___ Delegate
