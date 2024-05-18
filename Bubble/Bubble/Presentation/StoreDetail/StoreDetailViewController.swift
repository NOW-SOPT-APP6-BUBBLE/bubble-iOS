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
    
    private let priceList = StoreDetailPriceListStackView()
  
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        view.addSubviews(header, priceList)
        
        header.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        priceList.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
        
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
