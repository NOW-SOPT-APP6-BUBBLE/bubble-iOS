//
//  HomeViewController.swift
//  Bubble
//
//  Created by 서은수 on 5/9/24.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - Property

    // MARK: - Component

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            // Logger를 사용하여 로깅
            Logger.debugDescription("Family: \(family) Font names: \(names)")
        }
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        let attributedText = UILabel.createAttributedText(for: .headline1, withText: "headline1")!
        button.setAttributedTitle(attributedText, for: .normal)
        view.addSubview(button)
        
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        label.textAlignment = .center
        label.attributedText = UILabel.createAttributedText(for: .headline2, withText: "headline2")
        view.addSubview(label)
    }

    // MARK: - Set UI

    // MARK: - Helper

    // MARK: - Action

    // MARK: - Extension

    // MARK: - Delegate
}
