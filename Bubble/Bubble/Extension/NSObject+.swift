//
//  NSObject+.swift
//  Bubble
//
//  Created by 서은수 on 5/17/24.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
