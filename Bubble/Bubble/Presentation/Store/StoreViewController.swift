//
//  StoreViewController.swift
//  Bubble
//
//  Created by Chandrala on 5/20/24.
//

import UIKit

import SnapKit
import Then

final class StoreViewController: BaseViewController {
    
    // MARK: - Property
    
    private let storeCellData = [
        StoreCellModel(artistImage: UIImage(named: "artist1"), artistName: "YAOCHEN"),
        StoreCellModel(artistImage: UIImage(named: "artist2"), artistName: "JYP"),
        StoreCellModel(artistImage: UIImage(named: "artist3"), artistName: "DAY6"),
        StoreCellModel(artistImage: UIImage(named: "artist4"), artistName: "TWICE")
    ]
    
    // MARK: - Component
    
    private let headImage = UIImageView().then {
        $0.image = UIImage(named: "storeHeaderImage")
    }
    
    private lazy var artistCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        $0.backgroundColor = .white
        $0.delegate = self
        $0.dataSource = self
        $0.register(ArtistCollectionViewCell.self, forCellWithReuseIdentifier: ArtistCollectionViewCell.identifier)
        $0.register(TermsCollectionViewCell.self, forCellWithReuseIdentifier: TermsCollectionViewCell.identifier)
        }
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Set UI
    
    override func setLayout() {
        view.addSubviews(
            headImage,
            artistCollectionView
        )
        
        headImage.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(96)
            $0.height.equalTo(60)
        }
        
        artistCollectionView.snp.makeConstraints {
            $0.top.equalTo(headImage.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setStyle() {
        navigationItem.title = NavigationTitleName.more.rawValue

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
            $0.shadowColor = nil // 하단 구분선 없앨 목적
        }
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        
        navigationItem.setRightBarButtonItems([], animated: true)
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension StoreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screenWidth = UIScreen.main.bounds.width
            let cellWidth = screenWidth
            
            if indexPath.section == 0 {
                return CGSize(
                    width: cellWidth - 32,
                    height: Store.artistCellHeight.rawValue
                )
            } else {
                return CGSize(
                    width: cellWidth,
                    height: Store.termsCellHeight.rawValue
                )
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
}

// MARK: - UICollectionViewDataSource

extension StoreViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return storeCellData.count
        } else {
            return 1 // term
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ArtistCollectionViewCell.identifier,
                for: indexPath
            ) as? ArtistCollectionViewCell else { return UICollectionViewCell() }
            let itemData = storeCellData[indexPath.item]
            cell.setData(model: itemData)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TermsCollectionViewCell.identifier,
                for: indexPath
            ) as? TermsCollectionViewCell else { return UICollectionViewCell() }
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension StoreViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storeDetailVC = StoreDetailViewController()
        self.navigationController?.pushViewController(storeDetailVC, animated: true)
    }
}
