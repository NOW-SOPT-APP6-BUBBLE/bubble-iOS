//
//  UIFont+.swift
//  Bubble
//
//  Created by 서은수 on 5/9/24.
//

import UIKit

enum FontStyle: String {
    case headline1 = "Headline1"
    case headline2 = "Headline2"
    case headline3 = "Headline3"
    case name1 = "Name1"
    case name2 = "Name2"
    case name3 = "Name3"
    case name4 = "Name4"
    case sub1 = "Sub1"
    case sub2 = "Sub2"
    case sub3 = "Sub3"
    case body1 = "Body1"
    case body2 = "Body2"
}

enum FontName: String {
    case heavy = "AppleSDGothicNeoH00"
    case extraBold = "AppleSDGothicNeoEB00"
    case bold = "AppleSDGothicNeo-Bold"
    case medium = "AppleSDGothicNeo-Medium"
    case regular = "AppleSDGothicNeo-Regular"
    case thin = "AppleSDGothicNeo-Thin"
}

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
        default:
            fatalError("Invalid name")
        }
        
        return UIFont(name: fontName, size: size)
    }
}
