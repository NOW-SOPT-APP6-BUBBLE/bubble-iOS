//
//  StoreDetailHeaderInfo.swift
//  Bubble
//
//  Created by 심서현 on 5/17/24.
//

import UIKit

final class StoreDetailHeaderInfo: UIStackView {
    // MARK: - Property
    
    // MARK: - Component
    
        let titleLabel = UILabel().then {
            $0.attributedText = UILabel.createAttributedText(for: .body1, withText: "title")
//            $0.textColor = titleColor
        }
    
        let descriptionLabel = UILabel().then {
            $0.attributedText = UILabel.createAttributedText(for: .body2, withText: "description")
//            $0.textColor = descriptionColor
        }
    
        let stackView = UIStackView().then {
//            $0.addArrangedSubviews(titleLabel, descriptionLabel)
            $0.axis = .vertical
            $0.spacing = 6
        }
    
    // MARK: - Life Cycle
    
    
    // MARK: - Set UI
    
    
    // MARK: - Helper
    
    
    // MARK: - Action
    
}
    // MARK: - Extension
    
    
    // MARK: - ___ Delegate
    
    

    


//func StoreDetailHeaderInfo(title: String, description: String, titleColor: UIColor, descriptionColor: UIColor) -> UIStackView {
//    let titleLabel = UILabel().then {
//        $0.attributedText = UILabel.createAttributedText(for: .body1, withText: title)
//        $0.textColor = titleColor
//    }
//    
//    let descriptionLabel = UILabel().then {
//        $0.attributedText = UILabel.createAttributedText(for: .body2, withText: description)
//        $0.textColor = descriptionColor
//    }
//    
//    let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel]).then {
//        $0.axis = .vertical
//        $0.spacing = 6
//    }
//    
//    return stackView
//}
