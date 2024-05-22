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
    
    // MARK: - Property
    
    static let identifier = "TermsCollectionViewCell"
    
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
        $0.spacing = 16
        $0.distribution = .equalSpacing
        $0.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
    }
    
    // MARK: - Set UI
    
    override func setLayout() {
        self.addSubview(termsContainerView)
        termsContainerView.addSubviews(termsStackView, moveTopButton)
        
        termsContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(10)
            make.bottom.equalTo(moveTopButton.snp.bottom).offset(10)
        }
        
        termsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        moveTopButton.snp.makeConstraints { make in
            make.top.equalTo(termsStackView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
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
