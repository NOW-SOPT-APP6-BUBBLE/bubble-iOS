//
//  TermsCollectionViewCell.swift
//  Bubble
//
//  Created by Chandrala on 5/22/24.
//

import UIKit

import SnapKit
import Then

final class TermsCollectionViewCell: BaseCollectionViewCell {
    // MARK: - Component
    
    private let termsContainerView = UIView().then {
        $0.backgroundColor = .gray100
    }
    
    private let firstTermlabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "이용약관", color: .gray200)
    }
    
    private let secondTermLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "개인정보처리방침", color: .gray200)
    }
    
    private let thirdTermLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "운영정책", color: .gray200)
    }
    
    private let fourthTermLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "청년보호정책", color: .gray200)
    }
    
    private let fifthTermLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "사업자정보", color: .gray200)
    }
    
    private let moveTopButton = UIButton().then {
        if let attributedTitle = UILabel.createAttributedText(
            for: .body1,
            withText: "▲ Top",
            color: .gray200
        ) {
            $0.setAttributedTitle(attributedTitle, for: .normal)
            $0.addTarget(self, action: #selector(scrollToTop), for: .touchUpInside)
        }
    }
    
    private lazy var termsStackView = UIStackView(
        arrangedSubviews: [
            firstTermlabel,
            secondTermLabel,
            thirdTermLabel,
            fourthTermLabel,
            fifthTermLabel
        ]
    ).then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 8
        $0.distribution = .equalSpacing
    }
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .gray100
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    override func setLayout() {
        self.addSubview(termsContainerView)
        termsContainerView.addSubviews(termsStackView, moveTopButton)
        
        termsContainerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalTo(moveTopButton.snp.bottom)
        }
        
        termsStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(30)
        }
        
        moveTopButton.snp.makeConstraints {
            $0.top.equalTo(termsStackView.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Helper
    
    @objc private func scrollToTop() {
        var view = self.superview
        while let superview = view, !(superview is UICollectionView) {
            view = superview.superview
        }
        
        if let collectionView = view as? UICollectionView {
            collectionView.setContentOffset(.zero, animated: true)
        }
    }
}
