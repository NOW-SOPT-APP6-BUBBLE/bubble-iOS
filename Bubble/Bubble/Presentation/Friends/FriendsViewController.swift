//
//  FriendsViewController.swift
//  Bubble
//
//  Created by 서은수 on 5/9/24.
//

import UIKit

final class FriendsViewController: BaseViewController {
    
    // MARK: - Property
    
    var isDropDownArray = [false, false, false]
    let dummyTitle = ["내 프로필", "즐겨찾기", "추천 친구"]
    let dummyCnt = [nil, "2", "56"]
    
    // MARK: - Component

    private let storeBarButton = UIBarButtonItem(image: .iconStore, style: .plain, target: nil, action: nil).then {
        $0.tintColor = .black
    }
    
    private let searchBarButton = UIBarButtonItem(image: .iconSearch, style: .plain, target: nil, action: nil).then {
        $0.tintColor = .black
    }
    
    private lazy var friendsTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .white
        $0.sectionHeaderTopPadding = 0
        $0.showsHorizontalScrollIndicator = false
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
        $0.register(FriendsTableViewCell.self, forCellReuseIdentifier: FriendsTableViewCell.className)
        $0.register(FriendsHeaderView.self, forHeaderFooterViewReuseIdentifier: FriendsHeaderView.className)
        $0.register(FriendsFooterView.self, forHeaderFooterViewReuseIdentifier: FriendsFooterView.className)
    }
    
    // MARK: - Set UI
    
    override func setLayout() {
        view.addSubview(friendsTableView)
        
        friendsTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setStyle() {
        navigationItem.title = NavigationTitleName.friends.rawValue

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        let navigationBarAppearance = UINavigationBarAppearance().then {
            $0.backgroundColor = .white
            $0.titlePositionAdjustment = .init(
                horizontal: -CGFloat.greatestFiniteMagnitude,
                vertical: 0
            )
            $0.largeTitleTextAttributes = [.font: UIFont.appleSDGothicNeoFont(for: .headline1) ?? UIFont()]
            $0.titleTextAttributes = [.font: UIFont.appleSDGothicNeoFont(for: .headline3) ?? UIFont()]
//            $0.shadowImage = UIImage()
//            $0.backgroundImage = UIImage()
        }
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        
        navigationItem.setRightBarButtonItems([storeBarButton, searchBarButton], animated: true)
        navigationItem.rightBarButtonItem?.tintColor = .black
        
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    // MARK: - Helper
    
    // MARK: - Action
    
    // MARK: - Extension
    
    // MARK: - Delegate
}

// MARK: - UITableViewDataSource

extension FriendsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        isDropDownArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return isDropDownArray[section] ? 0 : 2
        case 2:
            return isDropDownArray[section] ? 0 : 56
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FriendsTableViewCell.className
        ) as? FriendsTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            cell.oneSentenceLabel.isHidden = true
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: FriendsHeaderView.className
        ) as? FriendsHeaderView
        else {
            return UIView()
        }
        
        if section == 0 {
            header.dropDownButton.isHidden = true
        } else {
            header.delegate = self
            header.tag = section
            header.dropDownButton.setImage(isDropDownArray[section] ? .iconFold : .iconUnfold, for: .normal)
        }
                
        header.headerLabel.text = dummyTitle[section]
        header.cellCountLabel.text = dummyCnt[section]
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (6 + 36 + 8)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: FriendsFooterView.className
        ) as? FriendsFooterView
        else {
            return UIView()
        }
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 0
        } else {
            return 5
        }
    }
}

// MARK: - DropDownDelegate

extension FriendsViewController: DropDownDelegate {
    
    func dropDownCells(section: Int) {
        self.isDropDownArray[section].toggle()
        
        let numberOfRows = self.friendsTableView.numberOfRows(inSection: section)
        for i in 0..<numberOfRows {
            let cell = self.friendsTableView.cellForRow(at: IndexPath(row: i, section: section)) as? FriendsTableViewCell
            cell?.isHidden.toggle()
        }
        
        friendsTableView.reloadSections(IndexSet(integer: section), with: .fade)
    }
}
