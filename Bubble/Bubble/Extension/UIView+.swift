//
//  UIView+.swift
//  Bubble
//
//  Created by 서은수 on 5/10/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
