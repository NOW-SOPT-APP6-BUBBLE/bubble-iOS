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
    
    private let storeDetailHeader = StoreDetailHeaderView()
  
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        view.addSubviews(storeDetailHeader)
        
        storeDetailHeader.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    override func setStyle() {
        view.backgroundColor = .gray700
        view.addSubviews(storeDetailHeader)
    }

    // MARK: - Helper
    
    // MARK: - Action
    
    // MARK: - Extension

    // MARK: - ___ Delegate
}
