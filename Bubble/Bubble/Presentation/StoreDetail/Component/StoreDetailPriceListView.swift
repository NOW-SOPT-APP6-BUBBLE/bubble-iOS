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

final class StoreDetailPriceListView: UIView {
    // MARK: - Property
    let maxShow = 3
    
    private let priceData: [PriceData] = [
        PriceData(count: "1인권", originPrice: "", currentPrice: "￦4,500"),
        PriceData(count: "2인권", originPrice: "￦9,000", currentPrice: "￦8,000"),
        PriceData(count: "3인권", originPrice: "￦13,500", currentPrice: "￦11,500"),
        PriceData(count: "4인권", originPrice: "￦18,000", currentPrice: "￦15,000"),
        PriceData(count: "5인권", originPrice: "￦22,500", currentPrice: "￦18,500"),
        PriceData(count: "6인권", originPrice: "￦27,000", currentPrice: "￦22,000"),
        PriceData(count: "7인권", originPrice: "￦31,500", currentPrice: "￦25,000"),
        PriceData(count: "8인권", originPrice: "￦36,000", currentPrice: "￦29,000"),
        PriceData(count: "9인권", originPrice: "￦40,500", currentPrice: "￦33,000"),
    ]
    
    // MARK: - Component
    
    private let moreButton = UIButton().then {
        if let attributedTitle = UILabel.createAttributedText(for: .body1, withText: "더보기", color: .white) {
            $0.setAttributedTitle(attributedTitle, for: .normal)
        }
        
        let topLine = UIView()
        topLine.backgroundColor = .gray800
        $0.addSubview(topLine)
        topLine.snp.makeConstraints {
            $0.top.width.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    private let priceList = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 14
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
        priceList.addArrangedSubviews(createPriceList())
        self.addSubviews(priceList, moreButton)
        
        priceList.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        moreButton.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        setMoreButtonHidden(priceData.count <= maxShow)
    }

    // MARK: - Helpers
    
    func setTarget() {
        moreButton.addTarget(self, action: #selector(moreButtonDidTap), for: .touchUpInside)
    }
    
    private func setMoreButtonHidden(_ isHidden: Bool) {
        moreButton.isHidden = isHidden
        
        if isHidden {
            moreButton.snp.remakeConstraints {
                $0.bottom.equalToSuperview()
            }
            
            priceList.snp.makeConstraints {
                $0.bottom.equalTo(self.snp.bottom).inset(26)
            }
        } else {
            moreButton.snp.makeConstraints {
                $0.top.equalTo(priceList.snp.bottom).offset(24)
                $0.bottom.equalTo(self.snp.bottom).inset(0)
            }
        }
    }
    
    // MARK: - Action
    
    @objc private func moreButtonDidTap() {
        for case let stackView as UIStackView in priceList.arrangedSubviews {
            stackView.isHidden = false
        }
        setMoreButtonHidden(true)
    }
}
// MARK: - Extension

extension StoreDetailPriceListView {
    func createPriceList() -> [UIStackView] {
        return priceData.enumerated().map { index, item in
            createPriceCard(
                count: item.count,
                originPrice: item.originPrice, currentPrice: item.currentPrice,
                index: index)
        }
    }
    
    func createPriceCard(count: String, originPrice: String, currentPrice: String, index: Int) -> UIStackView {
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
            
            $0.isHidden = index + 1 > maxShow
        }
        
        return stackView
    }
}

// MARK: - ___ Delegate
