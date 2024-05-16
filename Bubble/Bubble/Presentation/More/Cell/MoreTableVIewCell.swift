//
//  MoreTableViewCell.swift
//  Bubble
//
//  Created by Chandrala on 5/15/24.
//

import UIKit

final class MoreTableViewCell: BaseTableViewCell {
    static let identifier = "MoreTableViewCell"
    
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let titleLabel = UILabel().then {
        if let attributedText = UILabel.createAttributedText(for: .name2, withText: "") {
            $0.attributedText = attributedText
        }
        $0.textColor = .black
    }
    
    private let arrowImageView = UIImageView().then {
        $0.image = UIImage(named: "icon_blueArrow")
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setLayout() {
        self.addSubviews(iconImageView, titleLabel, arrowImageView)
        
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(3)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(18)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(14)
            $0.centerY.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(14)
        }
    }
    
    func configure(with model: MoreCellModel) {
        iconImageView.image = model.icon
        if let attributedText = UILabel.createAttributedText(for: .name2, withText: model.title) {
            titleLabel.attributedText = attributedText
        }
    }
}
