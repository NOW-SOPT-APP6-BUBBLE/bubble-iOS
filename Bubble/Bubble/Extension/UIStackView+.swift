//
//  UIStackView+.swift
//  Bubble
//
//  Created by 심서현 on 5/18/24.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
}
