//
//  FriendsHeaderView.swift
//  Bubble
//
//  Created by 서은수 on 5/17/24.
//

import UIKit

final class FriendsHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Component
    
    let headerLabel = UILabel().then {
        $0.textColor = .gray400
        $0.font = .appleSDGothicNeoFont(for: .sub2)
    }
    
    let cellCountLabel = UILabel().then {
        $0.textColor = .gray400
        $0.font = .appleSDGothicNeoFont(for: .sub1)
    }
    
    private let dropDownButton = UIButton().then {
        $0.setImage(.iconUnfold, for: .normal)
    }
    
    // MARK: - Init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    private func setLayout() {
        contentView.backgroundColor = .white
        contentView.addSubviews(headerLabel, cellCountLabel, dropDownButton)
        
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(16)
        }
        
        cellCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(headerLabel)
            $0.leading.equalTo(headerLabel.snp.trailing).offset(4)
        }
        
        dropDownButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
