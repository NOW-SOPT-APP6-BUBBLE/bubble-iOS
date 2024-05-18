//
//  StoreDetailHeaderInfoView.swift
//  Bubble
//
//  Created by 심서현 on 5/17/24.
//

import UIKit

final class StoreDetailHeaderInfoView: UIStackView {
    // MARK: - Property
    
    // MARK: - Component
    
    private let titleLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .body1, withText: "title")
    }
    
    private let descriptionLabel = UILabel()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("생성")
        setLayout()
        setStyle()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    func setLayout() {
        self.addArrangedSubviews(titleLabel, descriptionLabel)
    }
    
    func setStyle() {
        self.axis = .vertical
        self.spacing = 6
    }
    
    // MARK: - Helper
    
    // MARK: - Action
    
}
// MARK: - Extension

extension StoreDetailHeaderInfoView {
    func dataBind(title: String, titleColor: UIColor,
                  description: String, descriptionColor: UIColor) {
        titleLabel.attributedText = UILabel.createAttributedText(for: .body1, withText: title)
        titleLabel.textColor = titleColor
        
        dataBindDescription(description: description, color: descriptionColor)
    }
    
    func dataBindDescription(description: String, color: UIColor) {
        descriptionLabel.attributedText = UILabel.createAttributedText(for: .body2, withText: description)
        descriptionLabel.textColor = color
    }
}
    
// MARK: - ___ Delegate
