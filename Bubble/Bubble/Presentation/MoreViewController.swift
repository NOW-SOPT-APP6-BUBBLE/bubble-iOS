//
//  MoreViewController.swift
//  Bubble
//
//  Created by Chandrala on 5/15/24.
//

import UIKit

final class MoreViewController: BaseViewController {
    
    // MARK: - Property

    // MARK: - Component

    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "icon_profile")
    }

    private let editProfileButton = UIButton().then {
        $0.setImage(UIImage(named: "icon_modify"), for: .normal)
        $0.isUserInteractionEnabled = true
        $0.backgroundColor = .white
    }
    // TODO: - headline3->4로 변경
    private let userNameLabel = UILabel().then {
        if let attributedText = UILabel.createAttributedText(for: .headline3, withText: "언니") {
            $0.attributedText = attributedText
        }
        $0.textAlignment = .center
    }

    private let userEmailLabel = UILabel().then {
        if let attributedText = UILabel.createAttributedText(for: .sub3, withText: "abc@naver.com") {
            $0.attributedText = attributedText
        }
    }
    
    private let separatorView = UIView().then {
        $0.backgroundColor = .gray100
    }
    
    private let moreTableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
    }

    // MARK: - Set UI

    override func setLayout() {
        view.addSubviews(profileImageView, userNameLabel, userEmailLabel, separatorView, moreTableView)
        profileImageView.addSubview(editProfileButton)
        
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(120)
            $0.top.equalToSuperview().offset(112)
            $0.centerX.equalToSuperview()
        }
        
        editProfileButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.bottom.right.equalTo(profileImageView).inset(4)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(editProfileButton.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
        
        userEmailLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalTo(343)
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        moreTableView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    // MARK: - Helper

    private func register() {
        moreTableView.register(
            MoreTableViewCell.self,
            forCellReuseIdentifier: MoreTableViewCell.identifier
        )
    }
    // MARK: - Action

    // MARK: - Extension

    // MARK: <#___#>Delegate
}
