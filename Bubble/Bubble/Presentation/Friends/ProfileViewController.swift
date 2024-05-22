//
//  ProfileViewController.swift
//  Bubble
//
//  Created by 서은수 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class ProfileViewController: BaseViewController {
    
    // MARK: - Property
    
    var memberId: String?
    var artistMemberId: Int?
    
    private var isStar = false
    
    // MARK: - Component
    
    private lazy var xButton = UIButton().then {
        $0.setImage(.iconCloseWhite, for: .normal)
        $0.addTarget(self, action: #selector(xButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var starButton = UIButton().then {
        $0.setImage(.iconEmptyStar, for: .normal)
        $0.addTarget(self, action: #selector(starButtonDidTap), for: .touchUpInside)
    }
    
    private let profileImageView = UIImageView().then {
        $0.image = .iconProfile
        $0.layer.cornerRadius = 49
        $0.layer.masksToBounds = true
    }
    
    private let artistChipImageView = UIImageView().then {
        $0.image = .iconArtistChip
    }
    
    private let nameLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .headline2, color: .white)
    }
    
    private lazy var artistNameStackView = UIStackView(arrangedSubviews: [
        artistChipImageView,
        nameLabel
    ]).then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 6
    }
    
    private let oneSentenceLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .sub3, color: .gray100)
    }
    
    private let introduceLabel = PaddingLabel(
        padding: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
    ).then {
        $0.attributedText = UILabel.createAttributedText(for: .sub3, color: .white)
        $0.layer.borderColor = UIColor.gray200.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 10
    }
    
    private let addFriendLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .name1, withText: "bubble로 친구추가", color: .black)
    }
    
    private let addFriendView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.maskedCorners = [.layerMaxXMinYCorner]
        $0.layer.cornerRadius = 18
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArtistProfile()
    }
    
    // MARK: - Set UI
    
    override func setLayout() { 
        view.addSubviews(
            xButton,
            starButton,
            profileImageView,
            artistNameStackView,
            oneSentenceLabel,
            introduceLabel,
            addFriendView
        )
        addFriendView.addSubview(addFriendLabel)
        
        xButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(44)
        }
        
        starButton.snp.makeConstraints {
            $0.top.equalTo(xButton)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(44)
        }
        
        addFriendView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(52 + 34)
        }
        
        addFriendLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(17.5)
        }
        
        introduceLabel.snp.makeConstraints {
            $0.bottom.equalTo(addFriendView.snp.top).offset(-67)
            $0.centerX.equalToSuperview()
        }
        
        oneSentenceLabel.snp.makeConstraints {
            $0.bottom.equalTo(introduceLabel.snp.top).offset(-38)
            $0.centerX.equalToSuperview()
        }
        
        artistNameStackView.snp.makeConstraints {
            $0.bottom.equalTo(oneSentenceLabel.snp.top).offset(-5)
            $0.centerX.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints {
            $0.bottom.equalTo(artistNameStackView.snp.top).offset(-14)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(98)
        }
    }
    
    override func setStyle() { 
        view.backgroundColor = .gray300
    }
    
    // MARK: - Helper
    
    private func fetchArtistProfile() {
        guard let memberId = memberId,
              let artistMemberId = artistMemberId
        else {
            return
        }
        
        let request = ArtistProfileRequest(memberId: memberId, artistMemberId: artistMemberId)
        ArtistMembersService.shared.fetchArtistProfile(request: request) { res in
            switch res {
            case .success(let data):
                guard let data = data as? BaseModel<ArtistProfileResult> else { return }
                self.dataBind(model: data.result.toArtistProfileModel())
            case .requestError:
                Logger.debugDescription("요청 오류 입니다")
            case .decodingError:
                Logger.debugDescription("디코딩 오류 입니다")
            case .pathError:
                Logger.debugDescription("경로 오류 입니다")
            case .serverError:
                Logger.debugDescription("서버 오류입니다")
            case .networkFail:
                Logger.debugDescription("네트워크 오류입니다")
            }
        }
    }
    
    private func dataBind(model: ArtistProfileModel) {
        starButton.setImage(model.isSubscribed ? .iconStar : .iconEmptyStar, for: .normal)
        profileImageView.kf.setImage(with: model.imageURL)
        nameLabel.text = model.nickname
        oneSentenceLabel.text = model.introduction
        if let artistName = model.artistName {
            introduceLabel.text = "\(artistName) · \(model.artistMemberName)"
        } else {
            introduceLabel.text = "\(model.artistMemberName)"
        }
    }
    
    // MARK: - Action
    
    @objc private func xButtonDidTap() {
        self.dismiss(animated: true)
    }
    
    @objc private func starButtonDidTap() {
        // TODO: - 즐겨찾기 추가 및 삭제 API 연동 필요
        guard let memberId = memberId,
              let artistMemberId = artistMemberId
        else {
            return
        }
        
        isStar ? (
            /// 즐겨찾기 삭제
            ArtistMembersService.shared.deleteArtistSubs(memberId: memberId, artistMemberId: artistMemberId) { res in
                switch res {
                case .success(let data):
                    guard let data = data as? EmptyResultModel else { return }
                    print(data)
                    self.isStar.toggle()
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
            
        ):(
            /// 즐겨찾기 등록
            ArtistMembersService.shared.postArtistSubs(memberId: memberId, artistMemberId: artistMemberId) { res in
                switch res {
                case .success(let data):
                    guard let data = data as? EmptyResultModel else { return }
                    print(data)
                    self.isStar.toggle()
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
        )
        
        starButton.setImage(isStar ? .iconStar : .iconEmptyStar, for: .normal)
    }
}
