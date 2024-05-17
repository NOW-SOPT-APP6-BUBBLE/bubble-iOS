//
//  MoreViewController.swift
//  Bubble
//
//  Created by Chandrala on 5/15/24.
//

import UIKit

final class MoreViewController: BaseViewController {
    
    // MARK: - Property
    
    private let cellData = [
        MoreCellModel(icon: UIImage(named: "icon_person"), title: "My bubble"),
        MoreCellModel(icon: UIImage(named: "icon_store"), title: "STORE"),
        MoreCellModel(icon: UIImage(named: "icon_notice"), title: "Notice"),
        MoreCellModel(icon: UIImage(named: "icon_guide"), title: "FAQ")
    ]

    // MARK: - Component

    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "icon_profile")
        $0.layer.masksToBounds = true
    }

    private let editProfileButton = UIButton().then {
        $0.setImage(UIImage(named: "icon_modify"), for: .normal)
        $0.isUserInteractionEnabled = true
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.applyShadow(color: .black, alpha: 0.05, x: 0, y: 2, blur: 4)
    }

    private let userNameLabel = UILabel().then {
        if let attributedText = UILabel.createAttributedText(for: .headline4, withText: "언니") {
            $0.attributedText = attributedText
        }
        $0.textAlignment = .center
    }

    private let userEmailLabel = UILabel().then {
        if let attributedText = UILabel.createAttributedText(for: .sub3, withText: "abc@naver.com", color: UIColor.gray200) {
            $0.attributedText = attributedText
        }
    }
    
    private let separatorView = UIView().then {
        $0.backgroundColor = .gray100
    }
    
    private lazy var moreTableView = UITableView(frame: .zero, style: .plain).then {
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
    }
    
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
            $0.leading.trailing.equalToSuperview().offset(16)
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        moreTableView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview()
        }
    }

    // MARK: - Helper

    private func register() {
        moreTableView.register(
            MoreTableViewCell.self,
            forCellReuseIdentifier: MoreTableViewCell.identifier
        )
    }
}

// MARK: - UITableViewDelegate

extension MoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}

// MARK: - UITableViewDataSource

extension MoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MoreTableViewCell.identifier,
            for: indexPath
        ) as? MoreTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: cellData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
}
