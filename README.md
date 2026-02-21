
# 📚 Bookia Store

A production-style Flutter bookstore app focused on clean architecture, scalable feature modules, and polished authentication UX.

<p align="left">
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white" />
  <img alt="Dart" src="https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white" />
  <img alt="Architecture" src="https://img.shields.io/badge/Architecture-Clean%20%2B%20Feature--First-6f42c1" />
  <img alt="State Management" src="https://img.shields.io/badge/State%20Management-BLoC%20%2F%20Cubit-0A66C2" />
</p>

## ✨ Highlights

- 🔐 Complete Auth Flow: Login, Register, Forgot Password, OTP, Reset Password.
- 🌍 Localization: English + Arabic using `easy_localization`.
- 📱 Responsive UI: Adaptive sizing with `flutter_screenutil`.
- 🧱 Scalable Structure: Feature-first organization with clean boundaries.
- 🧭 Maintainable Codebase: Reusable core widgets, centralized strings and themes.

---

## 🧰 Tech Stack

- **Flutter** + **Dart**
- **BLoC/Cubit** for state management
- **easy_localization** for i18n
- **flutter_screenutil** for responsive design
- **flutter_gen** for strongly-typed assets

---

## 🏗️ Architecture

The project follows a **Feature-First + Clean Architecture** approach where each feature can evolve independently.

```text
lib/
├── core/
│   ├── share_widgets/
│   ├── theme/
│   └── utils/
├── features/
│   └── auth/
│       └── Presentation/
│           ├── welcome_screen.dart
│           ├── login_screen.dart
│           ├── register_screen.dart
│           ├── forgot_password.dart
│           ├── otp_verification.dart
│           ├── create_new_password.dart
│           └── password_changed.dart
└── main.dart
```

### Data Flow

```mermaid
graph TD
    UI[UI Layer] -->|User Action| Cubit[Cubit / Bloc]
    Cubit --> Repo[Repository]
    Repo --> Remote[Remote Data Source]
    Repo --> Local[Local Data Source]
    Remote --> Repo
    Local --> Repo
    Repo --> Cubit
    Cubit -->|State Updates| UI
```

---

## 📸 Screenshots

### Authentication Flow

Experience the complete authentication journey with our polished UI:

#### 🎯 Authentication Steps (1 → 6)

<table align="center">
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/48f765e4-9b93-400d-9e9f-181fc94a9a5b" width="220" alt="Auth Step 1" />
      <br/>
      <sub><b>Step 1 · Password Changed!</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/ae1bcd8a-71e9-42c4-9279-72b911fd0076" width="220" alt="Auth Step 2" />
      <br/>
      <sub><b>Step 2 · Create new password</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/2c0694e6-db31-4a97-98d4-c9c7770ad223" width="220" alt="Auth Step 3" />
      <br/>
      <sub><b>Step 3 · OTP Verification </b></sub>
    </td>
  </tr>
</table>

#### 🔑 Recovery Flow

<table align="center">
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/86ff0907-b9c5-4464-950e-3d988160aac7" width="220" alt="Auth Step 4" />
      <br/>
      <sub><b>Step 4 · Forgot Password</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/d193c066-f082-4436-9c81-d250198b6d42" width="220" alt="Auth Step 5" />
      <br/>
      <sub><b>Step 5 · Register</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/07a3e064-4467-4ec7-b926-3c0cbb4432bc" width="220" alt="Auth Step 6" />
      <br/>
      <sub><b>Step 6 ·welcome</b></sub>
    </td>
  </tr>
</table>

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed
- Dart SDK installed
- Android Studio or VS Code

### Run Locally

```bash
git clone https://github.com/your-username/bookia_store.git
cd bookia_store
flutter pub get
flutter run
```

### Optional: Regenerate Generated Files

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🤝 Contributing

Contributions are welcome.

1. Fork the repository
2. Create your branch: `git checkout -b feature/your-feature`
3. Commit changes: `git commit -m "Add your feature"`
4. Push branch: `git push origin feature/your-feature`
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
