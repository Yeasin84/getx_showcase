# 🚀 GetX Showcase – Flutter + Material 3

A minimal but production-style **Flutter app** demonstrating the power of **GetX** for:
* 🔄 State Management
* 🧭 Navigation
* 🧩 Dependency Injection (DI)
* 💬 Dialogs & UI Helpers
* 🎨 Clean UI/UX with Material 3 & Google Fonts

This project is designed as an **educational reference** for developers learning how to integrate GetX into real-world Flutter apps.

---

## ✨ Features

* **State Management**
  * Reactive (`.obs + Obx`) and non-reactive (`GetBuilder`) examples
* **Navigation**
  * Forward, replace, and reset navigation with one-liners
* **Dependency Injection**
  * Global controllers with `Get.put`, `Get.lazyPut`, `Get.find`
* **UI Helpers**
  * Snackbar, Dialog, Bottom Sheet with minimal code
* **Theme**
  * Light/Dark mode toggle powered by `Get.changeThemeMode`
* **UX Polish**
  * Material 3 design, rounded cards, smooth transitions, haptic feedback


## 🖼️ Screenshots



## 📂 Project Structure
lib/
 └── src/
     ├── app_theme.dart         # Material 3 theme setup
     ├── app_routes.dart        # Centralized route definitions
     ├── bindings/              # DI bindings
     ├── controllers/           # GetX controllers
     ├── pages/                 # Screens (Home, Details, etc.)
     └── widgets/               # Shared UI components

## 🚀 Getting Started

### 1. Clone the repo
git clone https://github.com/<your-username>/getx-showcase.git
cd getx-showcase

### 2. Install dependencies
flutter pub get

### 3. Run the app
flutter run


## 📦 Dependencies

* [get](https://pub.dev/packages/get) – State management, navigation, DI
* [google\_fonts](https://pub.dev/packages/google_fonts) – Beautiful typography
* Flutter SDK **3.x+**

---

## 🎯 Learning Objectives
This app demonstrates how to:
* Manage reactive & non-reactive state in GetX
* Use GetX for clean navigation without `BuildContext`
* Inject controllers/services globally with DI
* Show dialogs, snackbars, and bottom sheets elegantly
* Apply **Material 3 UI** principles for modern, polished apps

## 🔮 Next Steps

* Add authentication flow (Firebase Auth + GetX)
* Integrate API calls with GetConnect
* Extend architecture toward **clean architecture pattern**

## 📝 License
This project is licensed under the MIT License.
Feel free to use it as a starter template for your own apps.


👨‍💻 Created with ❤️ using **Flutter** and **GetX**

