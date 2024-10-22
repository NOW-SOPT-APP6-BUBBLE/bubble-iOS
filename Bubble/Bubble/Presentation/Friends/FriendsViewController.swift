//
//  FriendsViewController.swift
//  Bubble
//
//  Created by 서은수 on 5/9/24.
//

import UIKit

import SnapKit
import Then

final class FriendsViewController: BaseViewController {
    
    // MARK: - Property
    
    private let titles = ["내 프로필", "즐겨찾기", "추천 친구"]
    private let memberId = "1"

    private var starFriends: ArtistListCellData = .init()
    private var ordinaryFriends: ArtistListCellData = .init()
    
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
        }
        navigationItem.standardAppearance = navigationBarAppearance
        
        navigationItem.setRightBarButtonItems([storeBarButton, searchBarButton], animated: true)
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchArtistList()
    }
    
    // MARK: - Helper
    
    private func fetchArtistList() {
        ArtistMembersService.shared.fetchArtistList(memberId: memberId) { res in
            switch res {
            case .success(let data):
                guard let data = data as? BaseModel<ArtistListResult> else { return }
//                Logger.debugDescription(data.result.isSubsArtists)
                self.starFriends.dataModel = data.result.isSubsArtists
//                Logger.debugDescription(data.result.isNotSubsArtists)
                self.ordinaryFriends.dataModel = data.result.isNotSubsArtists
                self.friendsTableView.reloadSections(IndexSet(1...2), with: .fade)
            case .requestError:
                print("요청 오류 입니다")
            case .decodingError:
                print("디코딩 오류 입니다")
            case .pathError:
                print("경로 오류 입니다")
            case .serverError:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
    
    // MARK: - Action
    
    // MARK: - Extension
    
    // MARK: - Delegate
}

// MARK: - UITableViewDataSource

extension FriendsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return starFriends.isExpanded ? starFriends.dataModel.count : 0
        case 2:
            return ordinaryFriends.isExpanded ? ordinaryFriends.dataModel.count : 0
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
        
        let row = indexPath.row
        switch indexPath.section {
        case 0:
            cell.oneSentenceLabel.isHidden = true
        case 1:
            cell.dataBind(model: starFriends.dataModel[row])
        case 2:
            cell.dataBind(model: ordinaryFriends.dataModel[row])
        default:
            cell.dataBind(model: ordinaryFriends.dataModel[row])
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
        
        header.headerLabel.text = titles[section]
        header.delegate = self
        header.tag = section

        switch section {
        case 0:
            header.dropDownButton.isHidden = true
        case 1:
            header.cellCountLabel.text = "\(starFriends.dataModel.count)"
            header.dropDownButton.isUserInteractionEnabled = starFriends.dataModel.count != 0
            header.dropDownButton.setImage(
                starFriends.isExpanded ? .iconUnfold : .iconFold,
                for: .normal
            )
        case 2:
            header.cellCountLabel.text = "\(ordinaryFriends.dataModel.count)"
            header.dropDownButton.isUserInteractionEnabled = ordinaryFriends.dataModel.count != 0
            header.dropDownButton.setImage(
                ordinaryFriends.isExpanded ? .iconUnfold : .iconFold,
                for: .normal
            )
        default:
            break
        }
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileViewController = ProfileViewController()
        profileViewController.memberId = memberId
        
        let row = indexPath.row
        if indexPath.section == 1 {
            profileViewController.artistMemberId = starFriends.dataModel[row].artistMemberId
        } else if indexPath.section == 2 {
            profileViewController.artistMemberId = ordinaryFriends.dataModel[row].artistMemberId
        }
        
        profileViewController.modalPresentationStyle = .fullScreen
        self.present(profileViewController, animated: true)
    }
}

// MARK: - DropDownDelegate

extension FriendsViewController: DropDownDelegate {
    
    func dropDownCells(section: Int) {
        if section == 1 {
            self.starFriends.isExpanded.toggle()
        } else if section == 2 {
            self.ordinaryFriends.isExpanded.toggle()
        }
        self.friendsTableView.beginUpdates()
        self.friendsTableView.reloadSections(.init(1...2), with: .fade)
        self.friendsTableView.endUpdates()
        self.friendsTableView.reloadSections(IndexSet(1...2), with: .fade)
    }
}
