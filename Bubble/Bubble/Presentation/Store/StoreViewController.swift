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
//        $0.contentInset = UIEdgeInsets(top: 18, left: 0, bottom: 0, right: 0)
        $0.delegate = self
        $0.dataSource = self
        $0.register(ArtistCollectionViewCell.self, forCellWithReuseIdentifier: ArtistCollectionViewCell.className)
        $0.register(TermsCollectionViewCell.self, forCellWithReuseIdentifier: TermsCollectionViewCell.className)
        }
    
    private let listButton = UIBarButtonItem(image: .iconMenu, style: .plain, target: nil, action: nil).then {
        $0.tintColor = .black
    }
    
    private let searchButton = UIBarButtonItem(image: .iconSearch, style: .plain, target: nil, action: nil).then {
        $0.tintColor = .black
    }

    private lazy var closeButton = UIBarButtonItem(
        image: .iconClose,
        style: .plain,
        target: self,
        action: #selector(closeButtonDidTap)
    ).then {
        $0.tintColor = .black
    }
    
    private let storeNavigationBarTitle = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .headline3, withText: "STORE")
        $0.textAlignment = .center
    }
    
    private let homeIndicatorView = UIView().then {
        $0.backgroundColor = .white
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
            artistCollectionView,
            homeIndicatorView
        )
        
        headImage.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(96)
            $0.height.equalTo(60)
        }
        
        artistCollectionView.snp.makeConstraints {
            $0.top.equalTo(headImage.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(homeIndicatorView.snp.top)
        }
        
        homeIndicatorView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
        }
    }
    
    override func setStyle() {
        navigationItem.titleView = storeNavigationBarTitle
        navigationItem.setRightBarButtonItems([closeButton, searchButton], animated: true)
        navigationItem.setLeftBarButtonItems([listButton], animated: true)
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - Helper
    
    @objc private func closeButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
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
                    height: StoreCellHeight.artistCellHeight.rawValue
                )
            } else {
                return CGSize(
                    width: cellWidth,
                    height: StoreCellHeight.termsCellHeight.rawValue
                )
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 18, left: 0, bottom: 0, right: 0)
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
                withReuseIdentifier: ArtistCollectionViewCell.className,
                for: indexPath
            ) as? ArtistCollectionViewCell else { return UICollectionViewCell() }
            let itemData = storeCellData[indexPath.item]
            cell.setData(model: itemData)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TermsCollectionViewCell.className,
                for: indexPath
            ) as? TermsCollectionViewCell else { return UICollectionViewCell() }
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension StoreViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let maxOffsetY = scrollView.contentSize.height - scrollView.frame.size.height
        if scrollView.contentOffset.y > maxOffsetY {
            scrollView.contentOffset.y = maxOffsetY
        }
        
        let termsSectionIndex = 1
        let termsIndexPath = IndexPath(item: 0, section: termsSectionIndex)
        
        artistCollectionView.layoutIfNeeded()
        
        if let attributes = artistCollectionView.layoutAttributesForItem(at: termsIndexPath) {
            let termsCellTop = attributes.frame.origin.y - artistCollectionView.contentInset.top
            let scrollViewBottom = scrollView.contentOffset.y + scrollView.frame.size.height
            
            // termsCell의 top이 scrollView의 bottom에 보이기 시작할 때
            if scrollViewBottom >= termsCellTop {
                homeIndicatorView.backgroundColor = .gray100
            } else {
                homeIndicatorView.backgroundColor = .white
            }
        }
    }
}
