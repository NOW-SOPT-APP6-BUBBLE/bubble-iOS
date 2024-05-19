//
//  StoreDetailInformationView.swift
//  Bubble
//
//  Created by 심서현 on 5/19/24.
//

import UIKit
import SwiftUI

struct StoreDetailNotice {
    let title: String
    var check: Bool = false
    var fold: Bool = true
    
    let labels: [UILabel]
}

final class StoreDetailInformationView: UIView {
    // MARK: - Property
    var viewController: StoreDetailViewController?
    var noticeData = [
        StoreDetailNotice(title: "서비스 이용안내 동의", labels: [
            UILabel().then {
                $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "이용권의 인원 수 만큼, bubble 메시지를 수신할 ARTIST를 선택할 수 있습니다.\n\n선택한 ARTIST가 직접 보내는 bubble을 수신할 수 있습니다.", color: .gray500)
                $0.numberOfLines = 0
            },
            UILabel().then {
                $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "bubble for JYPnation의 회원 닉네임으로 ARTIST가 메시지를 보낼 수 있으니, 이용권을 구독하기 전, bubble for JYPnation 닉네임이 제대로 설정되어있는 지 확인해 주세요.\n(bubble for JYPnation 닉네임 수정 경로 : MORE > 프로필 선택 > 프로필 편집 > 닉네임 수정)\n\n이용권을 구독하는 시점에 원하는 ARTIST가 bubble 서비스를 제공하지 않을 수 있으니, bubble 상세에서 라인업된 ARTIST를 반드시 확인 후에 이용권을 구매해 주세요.", color: .white)
                $0.numberOfLines = 0
            },
            UILabel().then {
                $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "본 상품은 bubble for JYPnation 앱에서 구매/이용 가능합니다.\n\nARTIST의 라인업 및 혜택은 ARTIST와 기획사 사정으로 변경될  수 있습니다.", color: .gray500)
                $0.numberOfLines = 0
            }
        ]),
        StoreDetailNotice(title: "콘텐츠 관련 유의사항 동의", labels: [
            UILabel().then {
                $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "bubble for JYPnation에서 제공되는 ARTIST의 메시지, 사진, 영상, 음성 등 모든 콘텐츠는 유료회원만을 위한 독점 콘텐츠로, 외부로 유출할 경우 법적 책임을 질 수 있습니다.", color: .white)
                $0.numberOfLines = 0
            },
            UILabel().then {
                $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "모든 혜택은 구매자에 한해 이용 기간 내에만 제공되며 타인에게 판매 및 양도를 하실 수 없습니다.\n\n부적절한 활동을 하는 사용자는 자격이 제한되거나, 회원자격이 박탈될 수 있습니다.", color: .gray500)
                $0.numberOfLines = 0
            },
        ])
        ,
        StoreDetailNotice(title: "딥징 작성 시 유의사항 동의", labels: [
            UILabel().then {
                $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "회원의 답장 기능 사용 시 법적으로 금지되는 발송 내용은 아래와 같습니다.\n- 음란한 부호·문언\n- 아티스트 또는 제3자의 명예를 훼손하는 내용의 정보\n- 공포심이나 불안감을 유발하는 부호·문언\n- 법령에 따라 금지되는 사행 행위에 해당하는 정보\n- 범죄를 목적으로 하거나 교사 또는 방조하는 내용의 정보\n- 기타 법률에 따라 금지되는 내용의 정보\n\n이용자가 본 내용을 위반할 시, 서비스 이용약관에 의한 제재 및 관련 법률에 의해 처벌을 받을 수 있습니다. 또한 아티스트 또는 아티스트의 대리인에 의해 소 제기 시 회사는 법률에 따라 이용자의 정보를 해당 기관에 제공할 수 있습니다.\n(서비스 이용약관: MORE > 설정 > 서비스 이용약관)", color: .white)
                $0.numberOfLines = 0
            },
        ])
    ]
    
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
