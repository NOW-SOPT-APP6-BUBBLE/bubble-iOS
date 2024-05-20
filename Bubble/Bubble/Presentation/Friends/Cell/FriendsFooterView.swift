//
//  FriendsFooterView.swift
//  Bubble
//
//  Created by 서은수 on 5/17/24.
//

import UIKit

final class FriendsFooterView: UITableViewHeaderFooterView {
    
    // MARK: - Component
    
    private let separatorView = UIView().then {
        $0.backgroundColor = .gray100
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
        contentView.addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
