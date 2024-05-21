//
//  StoreDetailNotice.swift
//  Bubble
//
//  Created by 심서현 on 5/19/24.
//

import Foundation
import UIKit

struct StoreDetailNotice {
    let title: String
    var check: Bool = false
    var fold: Bool = true
    
    let labels: [UILabel]
}

func getStoreDetailNoticeData() -> [StoreDetailNotice] {
    return [
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

}
