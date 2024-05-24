## 🫧 bubble-iOS
    최애와 나만의 프라이빗 메시지 Bubble 🫧
    34기 NOW SOPT 합동세미나 앱 6팀 Bubble iOS 프로젝트 레포지토리입니다.

## 📱 Screens
|아티스트 목록 화면|아티스트 상세 프로필 화면|
|:--:|:--:|
|![Simulator Screen Recording - iPhone 13 Pro - 2024-05-24 at 23 50 33](https://github.com/NOW-SOPT-APP6-BUBBLE/bubble-iOS/assets/87434861/2cfa4a53-9887-4243-bc0e-fcc3cbd19701)|![Simulator Screen Recording - iPhone 13 Pro - 2024-05-24 at 23 51 14](https://github.com/NOW-SOPT-APP6-BUBBLE/bubble-iOS/assets/87434861/6f87c021-c829-4f25-a4b5-4fc4eda2f697)|

|더보기 및 스토어 화면|아티스트 스토어 상세 화면|
|:--:|:--:|
|![Simulator Screen Recording - iPhone 13 Pro - 2024-05-24 at 23 51 30](https://github.com/NOW-SOPT-APP6-BUBBLE/bubble-iOS/assets/87434861/2ba16a5c-2776-4b89-b7f8-dfdb3b0fc3c5)|![Simulator Screen Recording - iPhone 13 Pro - 2024-05-24 at 23 52 07](https://github.com/NOW-SOPT-APP6-BUBBLE/bubble-iOS/assets/87434861/7979f1df-0156-44d8-8214-d1a071c6ab5f)|

## 🍎 Developers
| [@EunsuSeo01](https://github.com/EunsuSeo01) | [@shimseohyun](https://github.com/shimseohyun) | [@Chandrarla](https://github.com/Chandrarla) |
|:---:|:---:|:---:|
|<img width="250" alt="EunsuSeo01" src="https://avatars.githubusercontent.com/EunsuSeo01">|<img width="250" alt="shimseohyun" src="https://avatars.githubusercontent.com/shimseohyun">|<img width="250" alt="Chandrarla" src="https://avatars.githubusercontent.com/Chandrarla">|
| `프로젝트 세팅` <br/> `Base 폴더 및 네트워크 세팅` <br/> `아티스트 목록 화면 구현 및 API 연동` <br/> `아티스트 프로필 화면 구현 및 API 연동` | `아티스트 스토어 상세 화면 구현 및 API 연동` <br/> `아티스트 즐겨찾기 삭제 API 연동` | `더보기 화면 구현` <br/> `스토어 화면 구현 및 API 연동` <br/> `아티스트 즐겨찾기 추가 API 연동` |

## 🛠 Development Environment
<img width="77" alt="iOS" src="https://img.shields.io/badge/iOS-17.0+-silver"> <img width="95" alt="Xcode" src="https://img.shields.io/badge/Xcode-15.0+-blue">

## 🌊 Git Flow
    1. 이슈 생성
        - 브랜치 최신화 되어있는지 확인 필요
    2. 새 브랜치 생성
    3. 해당 브랜치에서 작업 (작은 단위의 커밋!!)
        - 커밋 메세지에 #이슈번호 를 넣어 이슈와 연결
    4. 이슈의 작업 다 끝냈으면 에러 없이 잘 돌아가는지 확인
    5. develop 브랜치로 PR
    6. 코드리뷰 및 어프루브
        - 2명이 모두 어프루브 해야 머지할 수 있음
    7. 리뷰로 인한 수정사항이 있다면 반영 후 직접 머지
        - 팀원들에게 develop pull 받으라고 알려주기
    8. 해당 브랜치 삭제
    
## 🌳 Branch Convention
    이슈 하나당 브랜치 한 개
    
    tag/#이슈번호-setting
    ex) feat/#2-home, feat/#42-chat

## 🐥 Commit Convention
    Feat: 새로운 기능 추가
    Fix: 버그 해결
    Docs: 리드미 작성
    Style: 코드 변화가 없는 format 변경
    Refactor: 코드 개선, 리팩토링
    Chore: 프로젝트 파일 수정, gitignore 추가, 폴더 혹은 파일 삭제, asset 추가  
    
    Tag: 작업 내용 #이슈번호
    ex) Feat: Home View Did Load override #23

## 🦭 Pull Request
### Naming  
    [Tag] 작업 내용 한줄 정리 
    ex) [Feat] Home Screen View 구현
### Unit
    1개의 PR은 1,000  Line을 넘을 수 없음
    코드 리뷰시 가독성을 위함
### Code Review
    Pn 룰 사용
    - P1: 꼭 반영해 주세요 (Request Changes) - 이슈가 발생하거나 취약점이 발견되는 케이스 등
        리뷰어는 PR의 내용이 서비스에 중대한 오류를 발생할 수 있는 가능성을 잠재하고 있는 등 중대한 코드 수정이 반드시 필요하다고 판단되는 경우, `P1` 태그를 통해 리뷰 요청자에게 수정을 요청합니다. 리뷰 요청자는 p1 태그에 대해 리뷰어의 요청을 반영하거나, 반영할 수 없는 합리적인 의견을 통해 리뷰어를 설득할 수 있어야 합니다.
    - P2: 반영을 적극적으로 고려해 주시면 좋을 것 같아요 (Comment)
        작성자는 `P2`에 대해 수용하거나 만약 수용할 수 없는 상황이라면 반영할 수 없는 이유를 들어 설명하거나 다음에 반영할 계획을 명시적으로(새로운 이슈 발행 등으로) 표현할 것을 권장합니다. Request changes 가 아닌 Comment 와 함께 사용됩니다.
    - P3: 이런 방법도 있을 것 같아요~ 등의 사소한 의견입니다 (Chore)
        작성자는 `P3`에 대해 아무런 의견을 달지 않고 무시해도 괜찮습니다.

## 🗂 Folder Structure
```
📁 Project
├── 📁 Application
│   ├── AppDelegate
│   ├── SceneDelegate
│   ├── LaunchScreen
│   └── Info.plist
├── 📁 Base
│   ├── 🗂️ BaseModel
│   └── 🗂️ BaseViewController
├── 📁 Presentation
│   ├── 🗂️ (Shared)
│   ├── 🗂️ Home
│   │   ├── 🗂️ Model
│   │   │   └── HomeModel
│   │   ├── 🗂️ (Component)
│   │   ├── 🗂️ Cell
│   │   ├── HomeView
│   │   └── HomeViewController
│   └── 🗂️ More
│       ├── 🗂️ (Component)
│       ├── 🗂️ Cell
│       ├── MoreView
│       └── MoreViewController
├── 📁 Extention
│       ├── UIFont+
│       └── UIImage+
├── 📁 Util
│       └── Logger
├── 📁 Resource
│   ├── 🗂️ Font
│   │   ├── .ttf
│   │   └── .otf
│   └── Asset.xcassets
└── 📁 Network
    ├── 🗂️ Common
    │   ├── NetworkResult
    │   └── Config
    ├── 🗂️ Service
    │   ├── HomeService
    │   └── MoreService
    └── 🗂️ TargetType
        ├── HomeTargetType
        └── MoreTargetType
```

## 📖 SwiftLint Rule
```
disabled_rules:
- trailing_whitespace
- xctfail_message
- function_parameter_count
- legacy_constructor
- force_cast
- trailing_comma
- force_try
- identifier_name
- line_length
```

## 🎁 Library
| Name         | Version |         |
| ------------ | :-----: | :-----: |
| Then         | `3.0.0` |  `SPM`  |
| SnapKit      | `5.7.1` |  `SPM`  |
| Kingfisher   | `7.11.0`|  `SPM`  |
| Moya         | `15.0.3`|  `SPM`  |
