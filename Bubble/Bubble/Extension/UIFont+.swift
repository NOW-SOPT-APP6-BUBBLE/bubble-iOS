//
//  HomeViewController.swift
//  Bubble
//
//  Created by 서은수 on 5/9/24.
//

import UIKit

enum UIFontName: String {
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

extension UIFont {
    static func appleSDGothicNeoFont(for name: String) -> UIFont? {
        let size: CGFloat
        let fontName: String
        
        switch name {
        case "Headline1":
            size = 24
            fontName = "AppleSDGothicNeoH00"
        case "Headline2":
            size = 16
            fontName = "AppleSDGothicNeoH00"
        case "Headline3":
            size = 15
            fontName = "AppleSDGothicNeoEB00"
        case "Name1":
            size = 14
            fontName = "AppleSDGothicNeo-Bold"
        case "Name2":
            size = 14
            fontName = "AppleSDGothicNeo-Medium"
        case "Name3":
            size = 12
            fontName = "AppleSDGothicNeo-Bold"
        case "Name4":
            size = 12
            fontName = "AppleSDGothicNeo-Regular"
        case "Sub1":
            size = 11
            fontName = "AppleSDGothicNeoH00"
        case "Sub2":
            size = 11
            fontName = "AppleSDGothicNeo-Bold"
        case "Sub3":
            size = 11
            fontName = "AppleSDGothicNeoH00"
        case "Body1":
            size = 10
            fontName = "AppleSDGothicNeo-Medium"
        case "Body2":
            size = 10
            fontName = "AppleSDGothicNeo-Thin"
        default:
            fatalError("Invalid name")
        }
        
        return UIFont(name: fontName, size: size)
    }
}
