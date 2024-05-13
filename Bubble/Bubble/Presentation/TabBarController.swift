//
//  TabBarController.swift
//  Bubble
//
//  Created by 서은수 on 5/14/24.
//

import UIKit

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

/// 하단 탭바
final class TabBarController: UITabBarController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDefaultTabBar()
    }
    
    // MARK: - Helpers
    
    /// 기본 하단 탭바 생성
    private func createDefaultTabBar() {
        let friendsVC = FriendsViewController()
        configTabBar(
            tabDefaultImgName: .friends,
            tabSelectedImgName: .friends,
            viewController: friendsVC
        )
        // TODO: - 뷰컨 생성 후 할당
        let chatVC = FriendsViewController()
        configTabBar(
            tabDefaultImgName: .chat,
            tabSelectedImgName: .chat,
            viewController: chatVC
        )
        // TODO: - 뷰컨 생성 후 할당
        let moreVC = FriendsViewController()
        configTabBar(
            tabDefaultImgName: .more,
            tabSelectedImgName: .more,
            viewController: moreVC
        )
        
        self.viewControllers = [friendsVC, chatVC, moreVC]
    }
    
    /// 탭바 설정
    private func configTabBar(
        tabDefaultImgName: TabBarDefaultImgName,
        tabSelectedImgName: TabBarSelectedImgName,
        viewController: UIViewController
    ) {
        viewController.tabBarItem = UITabBarItem(
            title: nil,
            image: .init(named: tabDefaultImgName.rawValue)?.withRenderingMode(.alwaysOriginal),
            selectedImage: .init(named: tabSelectedImgName.rawValue)?.withRenderingMode(.alwaysOriginal)
        )
    }
}
