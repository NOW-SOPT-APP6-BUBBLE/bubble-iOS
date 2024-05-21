//
//  FriendsTableViewCell.swift
//  Bubble
//
//  Created by 서은수 on 5/17/24.
//

import UIKit

import Kingfisher
import SnapKit
import Then

final class FriendsTableViewCell: BaseTableViewCell {
    
    // MARK: - Property
    
    // MARK: - Component
    
    private let profileImageView = UIImageView().then {
        $0.image = .iconProfile
        $0.layer.cornerRadius = 18
        $0.layer.masksToBounds = true
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "언니"
        $0.textColor = .black
        $0.font = .appleSDGothicNeoFont(for: .name1)
    }
    
    let oneSentenceLabel = UILabel().then {
        $0.textColor = .gray500
        $0.font = .appleSDGothicNeoFont(for: .body2)
    }
    
    // MARK: - Life Cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageView.image = .iconProfile
        nameLabel.text = "언니"
        oneSentenceLabel.text = ""
        oneSentenceLabel.isHidden = false
    }
    
    // MARK: - Set UI
    
    override func setLayout() {
        contentView.addSubviews(profileImageView, nameLabel, oneSentenceLabel)
        
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(36)
        }
        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(13)
        }
        oneSentenceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(nameLabel)
        }
    }
    
    override func setStyle() {
        self.selectionStyle = .none
    }
    
    // MARK: - Helper
    
    func dataBind(model: ArtistListModel) {
        self.nameLabel.text = model.name
        self.profileImageView.kf.setImage(with: URL(string: model.imageURL))
        self.oneSentenceLabel.text = model.introduction
    }
}
