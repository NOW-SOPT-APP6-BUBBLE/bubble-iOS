//
//  StoreDetailHeaderView.swift
//  Bubble
//
//  Created by 심서현 on 5/18/24.
//

import UIKit

final class StoreDetailHeaderView: UIView {
    // MARK: - Property
    
    // MARK: - Component
    
    private var headerImage = UIImageView().then {
        $0.image = UIImage(named: "store_detail_default_header")
    }
    
    private var artistLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .name1, withText: "Day6")
        $0.textColor = .white
    }
    
    private let middleLine = UIView().then {
        $0.backgroundColor = .gray800
    }
    
    private let descriptionStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 16
        $0.isLayoutMarginsRelativeArrangement = true
        $0.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "선물처럼 찾아오는 최애의 메시지와 함께하는 설레이는 일상! \n최애 아티스트와 나만의 특별한 프라이빗 메시지, bubble for JYPnation")
        $0.textColor = .gray400
        $0.numberOfLines = 0
    }
    
    private let lineupInfo = StoreDetailHeaderInfoView().then {
        $0.dataBind(title: "ARTIST 라인업", titleColor: .white,
                    description: "WONPIL, DOWOON", descriptionColor: .white)
    }
    
    private let comingsoonInfo = StoreDetailHeaderInfoView().then {
        $0.dataBind(title: "Coming soon", titleColor: .gray600,
                    description: "SUNGJIN, Young K", descriptionColor: .gray600)
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
        descriptionStackView.addArrangedSubviews(descriptionLabel, lineupInfo, comingsoonInfo)
        
        self.addSubviews(headerImage, artistLabel, middleLine, descriptionStackView)
        
        headerImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
        }
        artistLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(headerImage.snp.bottom).offset(16)
        }
        middleLine.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(artistLabel.snp.bottom).offset(16)
            $0.width.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
        
        descriptionStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(middleLine.snp.bottom).offset(12)
            $0.bottom.equalToSuperview().inset(0)
        }
    }
    
    // MARK: - Helper
     
    // MARK: - Action
    
}
    
// MARK: - Extension
    
// MARK: - ___ Delegate
