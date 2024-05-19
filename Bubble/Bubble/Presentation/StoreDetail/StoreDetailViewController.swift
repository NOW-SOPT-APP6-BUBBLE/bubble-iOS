//
//  StoreDetailViewController.swift
//  Bubble
//
//  Created by 심서현 on 5/16/24.
//

import UIKit

final class StoreDetailViewController: BaseViewController {
    
    // MARK: - Property
    
    // MARK: - Component
    private var scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let header = StoreDetailHeaderView()
    
    private let priceList = StoreDetailPriceListView()
    
    private let infinityLine = UIView().then {
        $0.backgroundColor = .gray900
    }
    
    private let information = StoreDetailInformationView()
    
    private var buyButton = UIButton().then {
        if let attributedTitle = UILabel.createAttributedText(for: .name1, withText: "이용권 구매", color: .white) {
            $0.setAttributedTitle(attributedTitle, for: .normal)
        }
        
        $0.contentVerticalAlignment = .top
        var configuration = UIButton.Configuration.borderless()

        configuration.contentInsets = NSDirectionalEdgeInsets(top: 17, leading: 0, bottom: 0, trailing: 0)
        $0.configuration = configuration
        
        $0.layer.maskedCorners = [.layerMaxXMinYCorner]
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 18
        
        $0.backgroundColor = .gray200
        
        $0.isEnabled = false
    }
    // MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTarget()
    }
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        information.viewController = self
        view.addSubviews(scrollView, buyButton)
        scrollView.addSubview(contentView)
        contentView.addSubviews(header, priceList, infinityLine, information)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        buyButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(52)
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        header.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.width.equalToSuperview()
        }
        
        priceList.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        infinityLine.snp.makeConstraints {
            $0.top.equalTo(priceList.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(5)
        }
        
        information.snp.makeConstraints {
            $0.top.equalTo(infinityLine.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setStyle() {
        view.backgroundColor = .gray700
    }
    
    // MARK: - Helper
    
    private func setTarget() {
        buyButton.addTarget(self, action: #selector(buyButtonDidTap), for: .touchUpInside)
    }
    
    public func toggleBuyButton(isAble: Bool) {
        buyButton.isEnabled = isAble
        buyButton.backgroundColor =  isAble ? .jypBlue : .gray200
    }
    
    // MARK: - Action
    
    @objc private func buyButtonDidTap() {
        print("이용권 구매 버튼이 클릭되었습니다.")
    }
}
// MARK: - Extension

// MARK: - ___ Delegate
