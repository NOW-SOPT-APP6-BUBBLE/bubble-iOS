//
//  StoreDetailInformationView.swift
//  Bubble
//
//  Created by 심서현 on 5/19/24.
//

import UIKit

final class StoreDetailInformationView: UIView {
    // MARK: - Property
    
    var viewController: StoreDetailViewController?
    var noticeData = getStoreDetailNoticeData()
    
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
    
    private let noticeStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12
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
        let noticeList: [UIStackView] = noticeData.enumerated().map { index, item in
            return createNoticeCard(data: item, index: index)
        }

        noticeStackView.addArrangedSubviews(noticeList)
        
        self.addSubviews(bannerImage, infoLabel, infoDescription, noticeStackView)
        
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
        }
        noticeStackView.snp.makeConstraints {
            $0.top.equalTo(infoDescription.snp.bottom).offset(24)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30 + 52)
        }
    }
    
    // MARK: - Helper
    
    private func setFold(_ sender: UIButton) {
        let noticeCard: UIStackView = noticeStackView.subviews[sender.tag] as! UIStackView
        let descriptionView: UIStackView = noticeCard.subviews[1] as! UIStackView
        let foldIcon: UIButton = noticeCard.subviews[0].subviews[2] as! UIButton
        
        noticeData[sender.tag].fold.toggle()
        descriptionView.isHidden = noticeData[sender.tag].fold
        
        let iconName = noticeData[sender.tag].fold ? "icon_fold" : "icon_unfold"
        foldIcon.setImage(UIImage(named: iconName), for: .normal)
    }
    
    private func isAllChecked() -> Bool {
        return noticeData.allSatisfy { $0.check }
    }
    
    // MARK: - Action
    
    @objc func checkIconDidTab(_ sender: UIButton) {
        if !noticeData[sender.tag].check && noticeData[sender.tag].fold {
            setFold(sender)
        }
        
        noticeData[sender.tag].check.toggle()
        
        let iconName = noticeData[sender.tag].check ? "icon_checkBoxSelected" : "icon_checkBoxDefault"
        sender.setImage(UIImage(named: iconName), for: .normal)
        
        viewController?.toggleBuyButton(isAble: isAllChecked())
    }
    
    @objc func foldIconDidTab(_ sender: UIButton) {
        setFold(sender)
    }
}
// MARK: - Extension

extension StoreDetailInformationView {
    func createNoticeCard(data: StoreDetailNotice, index: Int) -> UIStackView {
        let checkIcon = UIButton().then {
            $0.tag = index
            $0.setImage(UIImage(named: "icon_checkBoxDefault"), for: .normal)
            $0.snp.makeConstraints {
                $0.width.height.equalTo(24)
            }
            
            $0.addTarget(self, action: #selector(checkIconDidTab(_:)), for: .touchUpInside)
        }
        
        let foldIcon = UIButton().then {
            $0.tag = index
            $0.setImage(UIImage(named: "icon_fold"), for: .normal)
            $0.snp.makeConstraints {
                $0.width.height.equalTo(24)
            }
            
            $0.addTarget(self, action: #selector(foldIconDidTab(_:)), for: .touchUpInside)
        }
        
        let titleLabel = UILabel().then {
            $0.attributedText = UILabel.createAttributedText(for: .body1, withText: data.title, color: .white)
        }
        
        let titleView = UIStackView(arrangedSubviews: [checkIcon, titleLabel, foldIcon]).then {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fill
        }
        
        let descriptionView = UIStackView(arrangedSubviews: data.labels).then {
            $0.axis = .vertical
            $0.spacing = 15
            $0.isLayoutMarginsRelativeArrangement = true
            $0.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 16, trailing: 10)
            
            $0.isHidden = true
        }
        
        let stackView = UIStackView(
            arrangedSubviews: [titleView, descriptionView]
        ).then {
            $0.backgroundColor = .gray800
            $0.isLayoutMarginsRelativeArrangement = true
            $0.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12)
            $0.layer.cornerRadius = 10
            $0.axis = .vertical
            $0.spacing = 12
        }
        
        return stackView
    }
}

// MARK: - ___ Delegate
