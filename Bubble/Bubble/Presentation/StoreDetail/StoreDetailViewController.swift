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
    
    private var bannerImage = UIImageView().then {
        $0.image = UIImage(named: "store_detail_default_banner")
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
        $0.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0)
    }
    private let descriptionLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "선물처럼 찾아오는 최애의 메시지와 함께하는 설레이는 일상! \n최애 아티스트와 나만의 특별한 프라이빗 메시지, bubble for JYPnation")
        $0.textColor = .gray400
        $0.numberOfLines = 0
    }
    
    private let lineupInfo = StoreDetailHeaderInfo(title: "ARTIST 라인업", description: "WONPIL, DOWOON", titleColor: .white, descriptionColor: .white)
    
    private let comingsoonInfo = StoreDetailHeaderInfo(title: "Coming soon", description: "SUNGJIN, Young K", titleColor: .gray600, descriptionColor: .gray600)
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.addArrangedSubview(lineupInfo)
        descriptionStackView.addArrangedSubview(comingsoonInfo)
        
        descriptionStackView.addArrangedSubviews(descriptionLabel, lineupInfo, comingsoonInfo)
        
        view.addSubviews(bannerImage, artistLabel, middleLine, descriptionStackView)
        
        bannerImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
        }
        artistLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(bannerImage.snp.bottom).offset(16)
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
