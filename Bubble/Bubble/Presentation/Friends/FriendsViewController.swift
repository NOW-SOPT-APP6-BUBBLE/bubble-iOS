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

    private var isDropDownArray = [true, true, true]
    private var starFriends: [ArtistListModel] = []
    private var ordinaryFriends: [ArtistListModel] = []
    
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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArtistList()
    }
    
    // MARK: - Helper
    
    private func fetchArtistList() {
        ArtistMembersService.shared.fetchArtistList(memberId: memberId) { res in
            switch res {
            case .success(let data):
                guard let data = data as? BaseModel<ArtistListResult> else { return }
                Logger.debugDescription(data.result.isSubsArtists)
                self.starFriends = data.result.isSubsArtists
                Logger.debugDescription(data.result.isNotSubsArtists)
                self.ordinaryFriends = data.result.isNotSubsArtists
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
        isDropDownArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return isDropDownArray[section] ? starFriends.count : 0
        case 2:
            return isDropDownArray[section] ? ordinaryFriends.count : 0
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
            cell.dataBind(model: starFriends[row])
        case 2:
            cell.dataBind(model: ordinaryFriends[row])
        default:
            cell.dataBind(model: ordinaryFriends[row])
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

        switch section {
        case 0:
            header.dropDownButton.isHidden = true
        case 1:
            header.cellCountLabel.text = "\(starFriends.count)"
            isDropDownArray[section] = starFriends.count != 0
            header.dropDownButton.isUserInteractionEnabled = starFriends.count != 0
        case 2:
            header.cellCountLabel.text = "\(ordinaryFriends.count)"
        default:
            break
        }
        
        if section != 0 {
            header.delegate = self
            header.tag = section
            header.dropDownButton.setImage(
                isDropDownArray[section] ? .iconUnfold : .iconFold,
                for: .normal
            )
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
        profileViewController.modalPresentationStyle = .fullScreen
        self.present(profileViewController, animated: true)
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
