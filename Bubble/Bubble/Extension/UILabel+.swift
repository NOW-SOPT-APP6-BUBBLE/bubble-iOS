//
//  UILabel+.swift
//  Bubble
//
//  Created by Chandrala on 5/11/24.
//

import UIKit

extension UILabel {
    static func createAttributedText(for fontName: FontStyle, withText text: String) -> NSAttributedString? {
        let letterSpacing: CGFloat
        
        switch fontName {
        case .headline1, .headline2, .headline3, .body1:
            letterSpacing = -0.3
        case .name1, .name2, .name4, .sub1, .sub3:
            letterSpacing = 0
        case .name3:
            letterSpacing = -0.5
        case .sub2:
            letterSpacing = -0.4
        case .body2:
            letterSpacing = 0.3
        }
        
        guard let font = UIFont.appleSDGothicNeoFont(for: fontName) else {
            print("Failed to load font")
            return nil
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .kern: letterSpacing
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
}
