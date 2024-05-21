//
//  ProfileViewController.swift
//  Bubble
//
//  Created by 서은수 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class ProfileViewController: BaseViewController {
    
    // MARK: - Property
    
    private var isStar = false
    
    // MARK: - Component
    
    private lazy var xButton = UIButton().then {
        $0.setImage(.iconCloseWhite, for: .normal)
        $0.addTarget(self, action: #selector(xButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var starButton = UIButton().then {
        $0.setImage(.iconEmptyStar, for: .normal)
        $0.addTarget(self, action: #selector(starButtonDidTap), for: .touchUpInside)
    }
    
    private let profileImageView = UIImageView().then {
        $0.image = .iconProfile
    }
    
    private let artistChipImageView = UIImageView().then {
        $0.image = .iconArtistChip
    }
    
    private let nameLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .headline2, withText: "팔불출❤️", color: .white)
    }
    
    private lazy var artistNameStackView = UIStackView(arrangedSubviews: [
        artistChipImageView,
        nameLabel
    ]).then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 6
    }
    
    private let oneSentenceLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .sub3, withText: "이제 떨어질 일 없다아❤️️", color: .gray100)
    }
    
    private let introduceLabel = PaddingLabel(
        padding: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
    ).then {
        $0.attributedText = UILabel.createAttributedText(for: .sub3, withText: "DAY6 · WONPIL", color: .white)
        $0.layer.borderColor = UIColor.gray200.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 10
    }
    
    private let addFriendLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .name1, withText: "bubble로 친구추가", color: .black)
    }
    
    private let addFriendView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.maskedCorners = [.layerMaxXMinYCorner]
        $0.layer.cornerRadius = 18
    }
    
    // MARK: - Set UI
    
    override func setLayout() { 
        view.addSubviews(
            xButton,
            starButton,
            profileImageView,
            artistNameStackView,
            oneSentenceLabel,
            introduceLabel,
            addFriendView
        )
        addFriendView.addSubview(addFriendLabel)
        
        xButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(44)
        }
        
        starButton.snp.makeConstraints {
            $0.top.equalTo(xButton)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(44)
        }
        
        addFriendView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(52 + 34)
        }
        
        addFriendLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(17.5)
        }
        
        introduceLabel.snp.makeConstraints {
            $0.bottom.equalTo(addFriendView.snp.top).offset(-67)
            $0.centerX.equalToSuperview()
        }
        
        oneSentenceLabel.snp.makeConstraints {
            $0.bottom.equalTo(introduceLabel.snp.top).offset(-38)
            $0.centerX.equalToSuperview()
        }
        
        artistNameStackView.snp.makeConstraints {
            $0.bottom.equalTo(oneSentenceLabel.snp.top).offset(-5)
            $0.centerX.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints {
            $0.bottom.equalTo(artistNameStackView.snp.top).offset(-14)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(98)
        }
    }
    
    override func setStyle() { 
        view.backgroundColor = .gray300
    }
    
    // MARK: - Helper
    
    // MARK: - Action
    
    @objc private func xButtonDidTap() {
        self.dismiss(animated: true)
    }
    
    @objc private func starButtonDidTap() {
        isStar.toggle()
        starButton.setImage(isStar ? .iconStar : .iconEmptyStar, for: .normal)
    }
    
    // MARK: - Extension
    
    // MARK: - Delegate
}