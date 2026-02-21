
# 📚 Bookia Store

Bookia Store is a modern, feature-rich Flutter application designed for browsing and purchasing books. This project demonstrates a scalable and maintainable architecture, perfect for real-world production applications.

## 🚀 Features

- **Authentication System**:
  - 🔐 Login & Registration
  - 🔑 Forgot Password & OTP Verification
  - 🔄 Create New Password
- **Responsive Design**: precise UI scaling using `flutter_screenutil`.
- **State Management**: Robust state handling with **BLoC/Cubit**.
- **Clean Architecture**: Separation of concerns for maintainability.

---

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) & [Dart](https://dart.dev/)
- **State Management**: [Bloc](https://pub.dev/packages/flutter_bloc) / Cubit
- **Architecture**: Feature-First / Clean Architecture
- **Responsive UI**: [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
- **Code Generation**: [flutter_gen](https://pub.dev/packages/flutter_gen) for assets management.
- **Dependency Injection**: _Starting to integrate GetIt (Planned)_

---

## 🏗️ Project Architecture & Structure

This project follows a **Feature-First** approach combined with **Clean Architecture principles**. Each feature is self-contained with its own data, domain (logic), and presentation layers.

### 📂 Folder Structure

```
lib/
├── core/                   # Core functionality shared across the app
│   ├── theme/              # App theme, colors, and styles
│   ├── utils/              # Utility classes, assets generation
│   └── ...
├── features/               # Feature-based modules
│   ├── auth/               # Authentication Feature
│   │   ├── data/           # Data layer (Repositories, Data Sources)
│   │   ├── cubit/          # State Management (Cubit/Bloc)
│   │   └── Presentation/   # UI Layer (Screens, Widgets)
│   │       ├── login_screen.dart
│   │       ├── register_screen.dart
│   │       └── ...
│   └── ...                 # Other features (Home, Cart, Profile)
└── main.dart               # App entry point
```

### 📐 Architecture Diagram

Below is a high-level overview of how data flows within a feature:

```mermaid
graph TD
    UI[🖥️ Layout & Widgets] -->|User Action| Cubit[⚡ Cubit / Bloc]
    Cubit -->|Request Data| Repo[📦 Repository]
    Repo -->|Fetch Data| Remote[🌐 Remote Data Source]
    Repo -->|Fetch Data| Local[💾 Local Data Source]
    Remote & Local -->|Return Data| Repo
    Repo -->|Return Data/Failure| Cubit
    Cubit -->|Emit State| UI
```

---

## 📸 Screenshots

<img width="390" height="720" alt="Screenshot from 2026-02-21 03-07-53" src="https://github.com/user-attachments/assets/48f765e4-9b93-400d-9e9f-181fc94a9a5b" />
<img width="387" height="716" alt="Screenshot from 2026-02-21 03-07-28" src="https://github.com/user-attachments/assets/ae1bcd8a-71e9-42c4-9279-72b911fd0076" />
<img width="387" height="715" alt="Screenshot from 2026-02-21 03-07-00" src="https://github.com/user-attachments/assets/2c0694e6-db31-4a97-98d4-c9c7770ad223" />
<img width="388" height="721" alt="Screenshot from 2026-02-21 03-06-17" src="https://github.com/user-attachments/assets/86ff0907-b9c5-4464-950e-3d988160aac7" />
<img width="385" height="717" alt="Screenshot from 2026-02-21 03-05-35" src="https://github.com/user-attachments/assets/d193c066-f082-4436-9c81-d250198b6d42" />


<p align="center">
  <img src="https://github.com/user-attachments/assets/e7bc12bf-dee3-470c-afe4-8e73fe5a21ad" width="250" />
  <img src="https://github.com/user-attachments/assets/674e699c-8abd-45f0-817b-9347b252ebb7" width="250" />
  <img src="https://github.com/user-attachments/assets/4212e914-0a48-43c8-a683-06e62c541e1a" width="250" />
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/4f09644c-0968-4c62-8b10-be3738e061ae" width="250" />
  <img src="https://github.com/user-attachments/assets/0f69f787-a74f-44bc-84db-b66e5f9c9401" width="250" />
  <img src="https://github.com/user-attachments/assets/22acbfeb-a84a-4f2f-8e04-95e94fe29cc2" width="250" />
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/fd8a52f6-45f8-49ca-ab6e-03b5f5912114" width="250" />
</p>

*(Note: These screenshots showcase the Bookia Store application features.)*

---

## 🚀 Getting Started

Follow these steps to run the project locally.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
- [Git](https://git-scm.com/) installed.

### Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/bookia_store.git
    cd bookia_store
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Generate code (if needed)**:
    ```bash
    flutter packages pub run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the app**:
    ```bash
    flutter run
    ```

---

## 🤝 Contributing

Contributions are welcome! If you find a bug or want to add a feature:

1.  Fork the project.
2.  Create your feature branch (`git checkout -b feature/AmazingFeature`).
3.  Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4.  Push to the branch (`git push origin feature/AmazingFeature`).
5.  Open a Pull Request.

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
