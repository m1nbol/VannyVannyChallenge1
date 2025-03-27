# 🥕바니바니🐻‍❄️
<table>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/f8840ab2-ef6a-4e50-b5d3-b35488703048" width="200">
    </td>
    <td style="padding-left: 20px; vertical-align: top;">
      <p>자연스럽고 부담 없이 고민을 털어놓을 수 있도록 하는 서비스입니다.<br>
      서툴러도, 정답이 없어도 괜찮아요.<br>
      마음속에 맴도는 생각들을 가볍게 꺼내놓는 것만으로도<br>
      당신은 이미 한 걸음 나아가고 있는 거니까요.<br><br>
      우리는 함께 듣고, 공감하고, 필요한 때엔 곁에서 방향을 함께 찾아갑니다.<br>
      혼자 고민하지 않아도 되는 곳,<br>
      이제, 당신의 이야기를 들려주세요. 🌱</p>
    </td>
  </tr>
</table>

## 개요 📚
> 애플 디벨로퍼 아카데미 챌린지 1 <br>
> 챌린지 기간 : 2025.3.17 ~ 2025.3.28 <br>
> 팀 멤버: Jeong, Jina, Seo, Velko, Minbol, Gyeong

## 시작 가이드
### Requirements
For building and running the application you need:
* iOS 18.2
* Xcode 16.2
* Swift 6.0

## 기술 스택 🛠️
### Envrionment
<div align="left">
<img src="https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white" />
<img src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white" />
</div>

### Development
<div align="left">
<img src="https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white" />
</div>

### Communication
<div align="left">
<img src="https://img.shields.io/badge/Miro-FFFC00.svg?style=for-the-badge&logo=Miro&logoColor=050038" />
<img src="https://img.shields.io/badge/Notion-white.svg?style=for-the-badge&logo=Notion&logoColor=000000" />
</div>

## 화면 구성 📱
<table>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/7b7f4fb3-06f7-4088-a092-cf58393d615f" width="200">
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/7399cfd2-311a-499a-b689-f957ecffaf9e" width="200">
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/356a2343-ef75-4f90-ad78-f72912d2b1c5" width="200">
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/465106e2-9c01-40a3-947d-1abc29da57d3" width="200">
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/ffcc9f06-5e5e-4658-a053-b5a47deb251e" width="200">
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/899450cd-0c3b-4956-ad42-8a5eb2695f18" width="200">
    </td>
  </tr>
</table>


## 아키텍처 및 프로젝트 구조
```
📦VannyVanny
 ┣ 📂App
 ┃ ┣ 📜AppFlowViewModel.swift
 ┃ ┗ 📜VannyVannyApp.swift
 ┣ 📂Assets.xcassets
 ┃ ┣ 📂AccentColor.colorset
 ┃ ┃ ┗ 📜Contents.json
 ┃ ┣ 📂AppIcon.appiconset
 ┃ ┃ ┣ 📜1024.png
 ┃ ┃ ┣ 📜114.png
 ┃ ┃ ┣ 📜120.png
 ┃ ┃ ┣ 📜180.png
 ┃ ┃ ┣ 📜29.png
 ┃ ┃ ┣ 📜40.png
 ┃ ┃ ┣ 📜57.png
 ┃ ┃ ┣ 📜58.png
 ┃ ┃ ┣ 📜60.png
 ┃ ┃ ┣ 📜80.png
 ┃ ┃ ┣ 📜87.png
 ┃ ┃ ┗ 📜Contents.json
 ┃ ┣ 📂Cheer
 ┃ ┃ ┣ 📂apple.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜apple.pdf
 ┃ ┃ ┣ 📂cheerApple.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜cheerApple.pdf
 ┃ ┃ ┣ 📂cheerBtn.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜cheerBtn.png
 ┃ ┃ ┣ 📂cheerLogo.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜cheerLogo.pdf
 ┃ ┃ ┣ 📂cheerTree.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜cheerTree.pdf
 ┃ ┃ ┣ 📂unCheer.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜unCheer.pdf
 ┃ ┃ ┗ 📜Contents.json
 ┃ ┣ 📂Components
 ┃ ┃ ┣ 📂leftArrow.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜leftArrow.pdf
 ┃ ┃ ┣ 📂leftChevron.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜leftChevron.pdf
 ┃ ┃ ┣ 📂mainButton.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜mainButton.pdf
 ┃ ┃ ┣ 📂subButton.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜subButton.pdf
 ┃ ┃ ┗ 📜Contents.json
 ┃ ┣ 📂Concern
 ┃ ┃ ┣ 📂addConcern.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜addConcern.pdf
 ┃ ┃ ┣ 📂homeTitle.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜homeTitle.pdf
 ┃ ┃ ┣ 📂treeOne.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜treeOne.pdf
 ┃ ┃ ┣ 📂treeThree.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜treeThree.pdf
 ┃ ┃ ┣ 📂treeTwo.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜treeTwo.pdf
 ┃ ┃ ┗ 📜Contents.json
 ┃ ┣ 📂Onboarding
 ┃ ┃ ┣ 📂onboardingBear.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜onboardingBear.pdf
 ┃ ┃ ┗ 📜Contents.json
 ┃ ┣ 📂Worry
 ┃ ┃ ┣ 📂worryFinal.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜worryFinal.pdf
 ┃ ┃ ┣ 📂worrySeedOne.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜worrySeedOne.pdf
 ┃ ┃ ┣ 📂worrySeedThree.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜worrySeedThree.pdf
 ┃ ┃ ┣ 📂worrySeedTwo.imageset
 ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜worrySeedTwo.pdf
 ┃ ┃ ┗ 📜Contents.json
 ┃ ┣ 📂background.imageset
 ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┗ 📜background.pdf
 ┃ ┣ 📂close.imageset
 ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┗ 📜close.pdf
 ┃ ┣ 📜.DS_Store
 ┃ ┗ 📜Contents.json
 ┣ 📂Components
 ┃ ┣ 📜CustomMainButton.swift
 ┃ ┣ 📜CustomNavigation.swift
 ┃ ┗ 📜CustomTextEditor.swift
 ┣ 📂Core
 ┃ ┣ 📂DIContainer
 ┃ ┃ ┗ 📜DIContainer.swift
 ┃ ┗ 📂Navigation
 ┃ ┃ ┣ 📜NavigationDestination.swift
 ┃ ┃ ┣ 📜NavigationRoutable.swift
 ┃ ┃ ┣ 📜NavigationRoutingView.swift
 ┃ ┃ ┗ 📜ObservableObjectSettable.swift
 ┣ 📂Model
 ┃ ┣ 📜Cheer.swift
 ┃ ┗ 📜Concern.swift
 ┣ 📂Modules
 ┃ ┣ 📂Cheer
 ┃ ┃ ┣ 📂ViewModels
 ┃ ┃ ┃ ┗ 📜CheerViewModel.swift
 ┃ ┃ ┗ 📂Views
 ┃ ┃ ┃ ┣ 📜AddCheerView.swift
 ┃ ┃ ┃ ┣ 📜CheerHarvestView.swift
 ┃ ┃ ┃ ┣ 📜CheerTreeView.swift
 ┃ ┃ ┃ ┗ 📜CheerView.swift
 ┃ ┣ 📂Greetings
 ┃ ┃ ┣ 📂ViewModel
 ┃ ┃ ┃ ┗ 📜GreetingViewModel.swift
 ┃ ┃ ┗ 📂Views
 ┃ ┃ ┃ ┗ 📜GreetingView.swift
 ┃ ┣ 📂Home
 ┃ ┃ ┣ 📂ViewModels
 ┃ ┃ ┃ ┗ 📜HomeViewModel.swift
 ┃ ┃ ┗ 📂Views
 ┃ ┃ ┃ ┣ 📜AddConcernButton.swift
 ┃ ┃ ┃ ┣ 📜ConcernCard.swift
 ┃ ┃ ┃ ┗ 📜HomeView.swift
 ┃ ┗ 📂WorryInput
 ┃ ┃ ┣ 📂ViewModel
 ┃ ┃ ┃ ┗ 📜WorryViewModel.swift
 ┃ ┃ ┗ 📂Views
 ┃ ┃ ┃ ┣ 📜WorryView.swift
 ┃ ┃ ┃ ┗ 📜WorryViewContents.swift
 ┣ 📂Preview Content
 ┃ ┗ 📂Preview Assets.xcassets
 ┃ ┃ ┗ 📜Contents.json
 ┣ 📂Resources
 ┃ ┣ 📂Color.xcassets
 ┃ ┃ ┣ 📂Gray
 ┃ ┃ ┃ ┣ 📂gray01.colorset
 ┃ ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┃ ┣ 📂gray02.colorset
 ┃ ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┃ ┣ 📂gray03.colorset
 ┃ ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┃ ┣ 📂gray04.colorset
 ┃ ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┣ 📂cancel.colorset
 ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┣ 📂floating.colorset
 ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┣ 📂mainColor.colorset
 ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┣ 📂overCircle.colorset
 ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┣ 📂textBlack.colorset
 ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┗ 📜Contents.json
 ┃ ┣ 📂Font
 ┃ ┃ ┣ 📜Font.swift
 ┃ ┃ ┣ 📜Ownglyphwiseelist.ttf
 ┃ ┃ ┣ 📜Pretendard-Bold.otf
 ┃ ┃ ┣ 📜Pretendard-Light.otf
 ┃ ┃ ┣ 📜Pretendard-Medium.otf
 ┃ ┃ ┣ 📜Pretendard-Regular.otf
 ┃ ┃ ┣ 📜Pretendard-SemiBold.otf
 ┃ ┃ ┗ 📜YoonChildfundkoreaDaeHan.otf
 ┃ ┣ 📂Keyboard
 ┃ ┃ ┗ 📜HideKeyboard.swift
 ┃ ┗ 📜gom.mp4
 ┣ 📜.DS_Store
 ┗ 📜Info.plist
```