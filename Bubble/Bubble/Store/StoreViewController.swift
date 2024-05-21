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
    
    private let StoreCellData = [
        StoreCellModel(artistImage: UIImage(named: "artist1"), artistName: "YAOCHEN"),
        StoreCellModel(artistImage: UIImage(named: "artist2"), artistName: "JYP"),
        StoreCellModel(artistImage: UIImage(named: "artist3"), artistName: "DAY6"),
        StoreCellModel(artistImage: UIImage(named: "artist4"), artistName: "TWICE")
    ]
    
    private let stackViewHeight: CGFloat = 50
    
    // MARK: - Component
    
    private let headImage = UIImageView().then {
        $0.image = UIImage(named: "storeHeaderImage")
    }
    
    private lazy var artistCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .white
        $0.delegate = self
        $0.dataSource = self
        $0.register(StoreCollectionViewCell.self, forCellWithReuseIdentifier: StoreCollectionViewCell.identifier)
        }
    
    private let label1 = UILabel().then {
        $0.text = "This is a footer label"
        $0.textAlignment = .center
    }
    
    private lazy var bottomStackView = UIStackView(arrangedSubviews: [label1]).then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.distribution = .equalSpacing
        $0.backgroundColor = .gray100
        $0.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bottomStackView.isHidden = true
    }
    // MARK: - Set UI
    
    override func setLayout() {
        view.addSubviews(
            headImage,
            artistCollectionView,
            bottomStackView
        )
        
        headImage.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(96)
            $0.height.equalTo(60)
        }
        
        artistCollectionView.snp.makeConstraints {
            $0.top.equalTo(headImage.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(36)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(artistCollectionView.snp.bottom)
            $0.height.equalTo(stackViewHeight)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension StoreViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.size.height
        
        if offsetY > contentHeight - scrollViewHeight - stackViewHeight {
            bottomStackView.isHidden = false
        } else {
            bottomStackView.isHidden = true
        }
    }
}

extension StoreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth - 32
        return CGSize(width: cellWidth, height: 205)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
}

extension StoreViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoreCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCollectionViewCell.identifier, for: indexPath) as? StoreCollectionViewCell else { return UICollectionViewCell() }
        let itemData = StoreCellData[indexPath.item]
        cell.setData(model: itemData)
        return cell
    }
}
