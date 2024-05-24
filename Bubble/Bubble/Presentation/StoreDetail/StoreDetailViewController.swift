//
//  StoreDetailViewController.swift
//  Bubble
//
//  Created by 심서현 on 5/16/24.
//

import UIKit

final class StoreDetailViewController: BaseViewController {
    
    // MARK: - Property
    
    var artistId: Int = 0
    
    // MARK: - Component
    
    private var scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let headerView = StoreDetailHeaderView()
    
    private let priceListView = StoreDetailPriceListView()
    
    private let separator = UIView().then {
        $0.backgroundColor = .gray900
    }
    
    private lazy var informationView = StoreDetailInformationView().then {
        $0.viewController = self
    }
    
    private lazy var buyButton = UIButton().then {
        if let attributedTitle = UILabel.createAttributedText(for: .name1, withText: "이용권 구매", color: .white) {
            $0.setAttributedTitle(attributedTitle, for: .normal)
        }
        
        $0.contentVerticalAlignment = .top
        var configuration = UIButton.Configuration.borderless()

        configuration.contentInsets = NSDirectionalEdgeInsets(top: 17, leading: 0, bottom: 0, trailing: 0)
        $0.configuration = configuration
        
        $0.layer.maskedCorners = [.layerMaxXMinYCorner]
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 18
        
        $0.backgroundColor = .gray200
        
        $0.isEnabled = false
        
        $0.addTarget(self, action: #selector(buyButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var closeButton = UIBarButtonItem(
        image: .iconClose,
        style: .plain,
        target: self,
        action: #selector(closeButtonDidTap)
    ).then {
        $0.tintColor = .black
    }
    
    private lazy var backButton = UIBarButtonItem(
        image: .iconBack,
        style: .plain,
        target: self,
        action: #selector(backButtonDidTap)
    ).then {
        $0.tintColor = .black
    }
    
    private let storeDetailNavigationBarTitle = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .headline3, withText: "bubble")
        $0.textAlignment = .center
    }
    
    // MARK: - init
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchStoreDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Set UI
    
    override func setLayout() {
        view.addSubviews(scrollView, buyButton)
        scrollView.addSubview(contentView)
        contentView.addSubviews(headerView, priceListView, separator, informationView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        buyButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(52)
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.width.equalToSuperview()
        }
        
        priceListView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(priceListView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(5)
        }
        
        informationView.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setStyle() {
        view.backgroundColor = .white
        scrollView.backgroundColor = .gray700
        navigationItem.titleView = storeDetailNavigationBarTitle
        navigationItem.setRightBarButtonItems([closeButton], animated: true)
        navigationItem.setLeftBarButtonItems([backButton], animated: true)
        navigationItem.hidesBackButton = true
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Helper
    
    public func toggleBuyButton(isAble: Bool) {
        buyButton.isEnabled = isAble
        buyButton.backgroundColor =  isAble ? .jypBlue : .gray200
    }
    
    private func fetchStoreDetail() {
        ArtistsServeice.shared.getStoreDetail(
            memberId: "1", artistId: self.artistId
        ) { res in
            switch res {
            case .success(let data):
                guard let data = data as? BaseModel<StoreDetailResult> else { return }
                Logger.debugDescription(data.result)
                
                self.headerView.dataBind(data.result.artist)
                self.priceListView.dataBind(data.result.artist.subscribe)
                self.informationView.dataBind(data.result.artist.description)
                
            case .requestError:
                print("요청 오류 입니다")
            case .decodingError:
                print("디코딩 오류 입니다")
            case .pathError:
                print("경로 오류 입니다")
            case .serverError:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
    
    @objc private func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func closeButtonDidTap() {
        guard let viewControllers = self.navigationController?.viewControllers else {
            return
        }
        
        if viewControllers.count >= 3 {
            let targetViewController = viewControllers[viewControllers.count - 3]
            self.navigationController?.popToViewController(targetViewController, animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // MARK: - Action
    
    @objc private func buyButtonDidTap() {
        print("이용권 구매 버튼이 클릭되었습니다.")
    }
}

// MARK: - Extension

// MARK: - ___ Delegate
