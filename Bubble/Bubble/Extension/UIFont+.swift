//
//  UIFont+.swift
//  Bubble
//
//  Created by 서은수 on 5/9/24.
//

import UIKit

extension UIFont {
    static func appleSDGothicNeoFont(for name: FontStyle) -> UIFont? {
        let size: CGFloat
        let fontName: String
        
        switch name {
        case .headline1:
            size = 24
            fontName = FontName.heavy.rawValue
        case .headline2:
            size = 16
            fontName = FontName.heavy.rawValue
        case .headline3:
            size = 16
            fontName = FontName.heavy.rawValue
        case .headline4:
            size = 15
            fontName = FontName.extraBold.rawValue
        case .name1:
            size = 14
            fontName = FontName.bold.rawValue
        case .name2:
            size = 14
            fontName = FontName.medium.rawValue
        case .name3:
            size = 12
            fontName = FontName.bold.rawValue
        case .name4:
            size = 12
            fontName = FontName.regular.rawValue
        case .sub1:
            size = 11
            fontName = FontName.heavy.rawValue
        case .sub2:
            size = 11
            fontName = FontName.bold.rawValue
        case .sub3:
            size = 11
            fontName = FontName.medium.rawValue
        case .body1:
            size = 10
            fontName = FontName.heavy.rawValue
        case .body2:
            size = 10
            fontName = FontName.medium.rawValue
        case .body3:
            size = 8
            fontName = FontName.extraBold.rawValue
        }
        
        return UIFont(name: fontName, size: size)
    }
}
