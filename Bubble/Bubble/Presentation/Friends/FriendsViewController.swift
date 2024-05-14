//
//  FriendsViewController.swift
//  Bubble
//
//  Created by 서은수 on 5/9/24.
//

import UIKit

enum NavigationTitleName: String {
    case friends = "FRIENDS"
    case more = "MORE"
}

final class FriendsViewController: BaseViewController {
    
    // MARK: - Property
    
    // MARK: - Component

    private let storeBarButton = UIBarButtonItem(image: .iconStore, style: .plain, target: nil, action: nil).then {
        $0.tintColor = .black
    }
    
    private let searchBarButton = UIBarButtonItem(image: .iconSearch, style: .plain, target: nil, action: nil).then {
        $0.tintColor = .black
    }
    
    private var scrollView = UIScrollView().then {
        $0.backgroundColor = .white
    }
        
    // MARK: - Set UI
    
    override func setLayout() {
        /// scrollView의 경우 스크롤 시 네비게이션 바 확인하기 위한 테스트용
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
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
