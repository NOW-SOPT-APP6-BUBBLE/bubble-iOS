//
//  ArtistCollectionViewCell.swift
//  Bubble
//
//  Created by Chandrala on 5/20/24.
//

import UIKit

import Kingfisher
import SnapKit
import Then
    
final class ArtistCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Property

    var artistId: Int = 0
    
    // MARK: - Component
    
    private let artistImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let bottomContainerView = UIView().then {
        $0.backgroundColor = .gray100
    }
    
    private let artistLabel = UILabel().then {
        if let attributedText = UILabel.createAttributedText(for: .name3, withText: " ") {
            $0.attributedText = attributedText
        }
    }
    
    private let bubbleChipImageView = UIImageView().then {
        $0.image = UIImage(named: "icon_bubbleChip")
        $0.contentMode = .scaleAspectFill
    }
    
    private let arrowImageView = UIImageView().then {
        $0.image = UIImage(named: "icon_rightArrow")
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Set UI
    
    override func setLayout() {
        self.addSubview(contentView)
        contentView.addSubviews(artistImageView, bottomContainerView)
        
        bottomContainerView.addSubviews(
            artistLabel,
            bubbleChipImageView,
            arrowImageView
        )
        
        artistImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomContainerView.snp.top)
        }
        
        bottomContainerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(55)
        }
        
        bubbleChipImageView.snp.makeConstraints {
            $0.width.equalTo(35)
            $0.height.equalTo(13)
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(16)
        }
        
        artistLabel.snp.makeConstraints {
            $0.leading.equalTo(bubbleChipImageView.snp.leading)
            $0.top.equalTo(bubbleChipImageView.snp.bottom).offset(4)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalTo(24)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    override func setStyle() {
        self.contentView.layer.cornerRadius = 12
        self.contentView.layer.masksToBounds = true
        
        self.layer.applyShadow(
            color: .black,
            alpha: 0.1,
            x: 0,
            y: 4,
            blur: 10
        )
    }

    // MARK: - Helper
    
    func dataBind(_ data: StoreArtist) {
        self.artistLabel.text = data.name
        self.artistImageView.kf.setImage(with: URL(string: data.photo))
        self.artistId = data.artistId
    }
}
