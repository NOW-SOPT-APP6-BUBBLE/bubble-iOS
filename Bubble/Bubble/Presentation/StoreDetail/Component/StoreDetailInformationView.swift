//
//  StoreDetailInformationView.swift
//  Bubble
//
//  Created by 심서현 on 5/19/24.
//

import UIKit

final class StoreDetailInformationView: UIView {
    // MARK: - Property
    
    // MARK: - Component
    
    private var bannerImage = UIImageView().then {
        $0.image = UIImage(named: "store_detail_banner")
    }
    
    private let infoLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .body1, withText: "소개", color: .white)
    }
    
    private let infoDescription = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "bubble for JYPnation NMIXX는 NMIXX 팬들을 위한 특별한 서비스입니다.\n\n나만의 최애 NMIXX 멤버가 직접 작성하는 개성 넘치는 프라이빗한 메시지를 받을 수 있습니다.\n\nbubble for JYPnation은 아티스트의 창작활동을 지원하고 응원합니다.", color: .gray500)
        $0.numberOfLines = 0
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
        self.addSubviews(bannerImage, infoLabel, infoDescription)
        
        bannerImage.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(bannerImage.snp.bottom).offset(20)
        }
        
        infoDescription.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(8)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Helper
    
    // MARK: - Action
    
}
// MARK: - Extension

// MARK: - ___ Delegate
