//
//  Logger.swift
//  Bubble
//
//  Created by 서은수 on 5/9/24.
//

import Foundation

class Logger {
    /// 로그 찍을 때 이용
    /// ```
    /// Logger.debugDescription("clientError:\(String(describing: message))")
    /// Logger.debugDescription(self.targetContent)
    /// ```
    static func debugDescription<T>(_ object: T?, filename: String = #file, line: Int = #line, funcName: String = #function) {
        #if DEBUG
        if let obj = object {
            print("\(Date()) \((filename.components(separatedBy: "/").last! as NSString).deletingPathExtension)(\(line)) - \(funcName) : \(obj)")
        } else {
            print("\(Date()) \(filename.components(separatedBy: "/").last ?? "")(\(line)) - \(funcName) : nil")
        }
        #endif
    }
}
