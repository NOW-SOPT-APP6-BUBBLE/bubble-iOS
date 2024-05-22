## 🫧 34기 NOW SOPT 합동세미나 6팀 : bubble-iOS 🫧

### 📱 Screens
||||
|--|--|--|
||||

### 🍎 Members
| [@EunsuSeo01](https://github.com/EunsuSeo01) | [@shimseohyun](https://github.com/shimseohyun) | [@Chandrarla](https://github.com/Chandrarla) |
|:---:|:---:|:---:|
|<img width="250" alt="EunsuSeo01" src="https://avatars.githubusercontent.com/EunsuSeo01">|<img width="250" alt="shimseohyun" src="https://avatars.githubusercontent.com/shimseohyun">|<img width="250" alt="Chandrarla" src="https://avatars.githubusercontent.com/Chandrarla">|
| `프로젝트 세팅` <br/> `Base 폴더 및 네트워크 세팅` <br/> `아티스트 목록 화면 구현 및 API 연동` <br/> `아티스트 프로필 화면 구현 및 API 연동` | `아티스트 스토어 상세 화면 구현 및 API 연동` <br/> `아티스트 즐겨찾기 삭제 API 연동` | `더보기 화면 구현` <br/> `스토어 화면 구현 및 API 연동` <br/> `아티스트 즐겨찾기 추가 API 연동` |

### 🛠 Development Environment
<img width="77" alt="iOS" src="https://img.shields.io/badge/iOS-17.0+-silver"> <img width="95" alt="Xcode" src="https://img.shields.io/badge/Xcode-15.0+-blue">

### 📌 Team Conventions

### 🗂 Folder Structure
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

### 📖 SwiftLint Rule
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

### 🎁 Library
| Name         | Version |         |
| ------------ | :-----: | :-----: |
| Then         | `3.0.0` |  `SPM`  |
| SnapKit      | `5.7.1` |  `SPM`  |
| Kingfisher   | `7.11.0`|  `SPM`  |
| Moya         | `15.0.3`|  `SPM`  |
