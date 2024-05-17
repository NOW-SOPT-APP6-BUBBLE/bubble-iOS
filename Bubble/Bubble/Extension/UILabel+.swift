//
//  UILabel+.swift
//  Bubble
//
//  Created by Chandrala on 5/11/24.
//

import UIKit

extension UILabel {
    static func createAttributedText(for fontName: FontStyle, withText text: String, color: UIColor = .black) -> NSAttributedString? {
        let letterSpacing: CGFloat
        
        switch fontName {
        case .headline1, .headline3, .headline4, .name3:
            letterSpacing = -0.3
        case .headline2, .name1, .name2, .name4, .sub1, .sub3, .body1, .body2, .body3:
            letterSpacing = 0
        case .sub2:
            letterSpacing = -0.4
        }
        
        guard let font = UIFont.appleSDGothicNeoFont(for: fontName) else {
            print("Failed to load font")
            return nil
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .kern: letterSpacing,
            .foregroundColor: color
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
}
