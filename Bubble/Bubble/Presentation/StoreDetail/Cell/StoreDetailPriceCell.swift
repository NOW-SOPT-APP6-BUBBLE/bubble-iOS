//
//  StoreDetailPriceCell.swift
//  Bubble
//
//  Created by 심서현 on 5/18/24.
//

import UIKit

final class StoreDetailPriceCell: BaseTableViewCell {
    // MARK: - Property
    
    // MARK: - Component
    private let rect = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20)).then {
        $0.backgroundColor = .yellow
    }
    // MARK: - Init
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        contentView.addSubview(rect)
    }
    
    // MARK: - Helper
    
    // MARK: - Action
    
}

    // MARK: - Extension
    
    // MARK: - ___ Delegate
