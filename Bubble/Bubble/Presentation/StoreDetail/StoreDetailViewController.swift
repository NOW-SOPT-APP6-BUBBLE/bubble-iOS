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
    
    private let header = StoreDetailHeaderView()
    
    private let priceList = StoreDetailPriceListView()
    
    private let infinityLine = UIView().then {
        $0.backgroundColor = .gray900
    }
  
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        view.addSubviews(header, priceList, infinityLine)
        
        header.snp.makeConstraints {
            $0.top.equalToSuperview()
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
    }
    
    override func setStyle() {
        view.backgroundColor = .gray700
    }

    // MARK: - Helper
    
    // MARK: - Action
    
    // MARK: - Extension

    // MARK: - ___ Delegate
}
