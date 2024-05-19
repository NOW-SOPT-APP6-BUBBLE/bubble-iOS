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
  
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(header, priceList, infinityLine, information)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
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
    
    // MARK: - Action
    
    // MARK: - Extension

    // MARK: - ___ Delegate
}
