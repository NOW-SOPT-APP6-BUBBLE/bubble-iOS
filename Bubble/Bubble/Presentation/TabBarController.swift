//
//  TabBarController.swift
//  Bubble
//
//  Created by 서은수 on 5/14/24.
//

import UIKit

import SnapKit
import Then

enum TabBarDefaultImgName: String {
    case friends = "icon_tabPersonDefault"
    case chat = "icon_tabChatDefault"
    case more = "icon_tabMoreDefault"
}

enum TabBarSelectedImgName: String {
    case friends = "icon_tabPersonSelected"
    case chat = "icon_tabChatSelected"
    case more = "icon_tabMoreSelected"
}

final class TabBarController: UITabBarController {
    
    // MARK: - Component
    
    let roundedBorderView = UIView().then {
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.layer.borderColor = UIColor.gray100.cgColor
        $0.layer.borderWidth = 1
        $0.isUserInteractionEnabled = false
    }
    
    let whiteCoverView = UIView().then {
        $0.backgroundColor = .white
        $0.isUserInteractionEnabled = false
    }

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setStyle()
        setTabBar()
    }
    
    // MARK: - Set UI
    
    private func setLayout() {
        self.tabBar.addSubviews(roundedBorderView, whiteCoverView)
        
        roundedBorderView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        whiteCoverView.snp.makeConstraints {
            $0.top.equalTo(roundedBorderView.snp.bottom).offset(-1)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }

    private func setStyle() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
        
        tabBar.layer.cornerRadius = 10
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.applyShadow()
    }
    
    // MARK: - Helpers
    
    private func setTabBar() {
        let friendsNavigationController = UINavigationController(rootViewController: FriendsViewController())
        configTabBar(
            tabDefaultImgName: .friends,
            tabSelectedImgName: .friends,
            viewController: friendsNavigationController
        )
        // TODO: - 뷰컨 생성 후 할당
        let chatViewController = UIViewController().then {
            $0.view.backgroundColor = .white
        }
        let chatNavigationController = UINavigationController(rootViewController: chatViewController)
        configTabBar(
            tabDefaultImgName: .chat,
            tabSelectedImgName: .chat,
            viewController: chatNavigationController
        )
        
        let moreNavigationController = UINavigationController(rootViewController: MoreViewController())
        configTabBar(
            tabDefaultImgName: .more,
            tabSelectedImgName: .more,
            viewController: moreNavigationController
        )
        
        self.viewControllers = [friendsNavigationController, chatNavigationController, moreNavigationController]
    }
    
    private func configTabBar(
        tabDefaultImgName: TabBarDefaultImgName,
        tabSelectedImgName: TabBarSelectedImgName,
        viewController: UIViewController
    ) {
        let tabBarItem = UITabBarItem(
            title: nil,
            image: .init(named: tabDefaultImgName.rawValue)?.withRenderingMode(.alwaysOriginal),
            selectedImage: .init(named: tabSelectedImgName.rawValue)?.withRenderingMode(.alwaysOriginal)
        )
        tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        viewController.tabBarItem = tabBarItem
    }
}
