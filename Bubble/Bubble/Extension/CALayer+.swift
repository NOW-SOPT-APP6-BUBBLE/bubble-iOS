//
//  CALayer+.swift
//  Bubble
//
//  Created by 서은수 on 5/14/24.
//

import UIKit

extension CALayer {
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.05,
        x: CGFloat = 0,
        y: CGFloat = -4,
        blur: CGFloat = 10
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
}
