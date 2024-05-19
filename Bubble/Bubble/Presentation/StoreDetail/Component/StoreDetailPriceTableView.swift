//
//  StoreDetailPriceTableView.swift
//  Bubble
//
//  Created by 심서현 on 5/18/24.
//

import UIKit

final class StoreDetailPriceTableView: UITableView {
    // MARK: - Property
    
    // MARK: - Component
    
    // MARK: - Init
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    func setLayout() {
        self.backgroundColor = .yellow
        self.dataSource = self
        self.delegate = self
        
        self.register(StoreDetailPriceCell.self, forCellReuseIdentifier: StoreDetailPriceCell.className)
    }
    
    // MARK: - Helper
    
    // MARK: - Action

}
// MARK: - Extension
      
// MARK: - UITableViewDataSource

extension StoreDetailPriceTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: StoreDetailPriceCell.className
        ) as? StoreDetailPriceCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

// MARK: - UITableView Delegate

extension StoreDetailPriceTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0 
    }
}
