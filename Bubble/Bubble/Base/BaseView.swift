//
//  BaseView.swift
//  Bubble
//
//  Created by 심서현 on 5/19/24.
//

import UIKit

/// 모든 UIView는 BaseView를 상속 받는다.
/// - setLayout랑 setStyle를 override하여 각 View에 맞게 함수 내용을 작성한다.
/// - 각 View에서는 setLayout과 setStyle 함수를 호출하지 않아도 된다.
class BaseView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI

    func setLayout() { }

    func setStyle() { }
}
