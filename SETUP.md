# Flutter Movie App - Complete Setup Guide

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.1.5 or higher)
- Dart SDK (included with Flutter)
- Android Studio / VS Code with Flutter extensions
- Git
- TMDB API account

### 1. Clone the Repository
```bash
git clone <your-repo-url>
cd flutter_application_1
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Get TMDB API Key
1. Go to [TMDB Website](https://www.themoviedb.org/)
2. Create a free account
3. Go to Settings → API
4. Request an API key (choose "Developer" option)
5. Copy your API key

### 4. Configure API Key
The API key is already configured in `lib/movies_page.dart`:
```dart
const String apiKey = "2015568464ce3f6ca5aca4191bd116fb";
```

### 5. Run the App
```bash
flutter run
```

## 🛠️ Development Environment Setup

### Flutter Installation

#### Windows:
1. Download Flutter SDK from [flutter.dev](https://flutter.dev/docs/get-started/install/windows)
2. Extract to `C:\flutter`
3. Add `C:\flutter\bin` to your PATH
4. Run `flutter doctor` to verify installation

#### macOS:
```bash
# Using Homebrew
brew install flutter

# Or download from flutter.dev
```

#### Linux:
```bash
# Download and extract Flutter
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.0-stable.tar.xz
tar xf flutter_linux_3.16.0-stable.tar.xz
export PATH="$PATH:`pwd`/flutter/bin"
```

### IDE Setup

#### VS Code:
1. Install Flutter extension
2. Install Dart extension
3. Open project folder
4. Press `Ctrl+Shift+P` → "Flutter: Select Device"

#### Android Studio:
1. Install Flutter plugin
2. Install Dart plugin
3. Open project
4. Configure device in AVD Manager

### Device Setup

#### Android:
1. Enable Developer Options on your phone
2. Enable USB Debugging
3. Connect via USB or use Android Emulator

#### iOS (macOS only):
1. Install Xcode from App Store
2. Connect iPhone via USB
3. Trust developer certificate

## 📱 Running the App

### Check Flutter Installation
```bash
flutter doctor
```

### Get Dependencies
```bash
flutter pub get
```

### Run on Different Platforms
```bash
# Android
flutter run

# iOS (macOS only)
flutter run -d ios

# Web
flutter run -d web-server --web-port 8080

# Windows (Windows only)
flutter run -d windows

# macOS (macOS only)
flutter run -d macos
```

### Build for Production
```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (macOS only)
flutter build ios --release

# Web
flutter build web --release
```

## 🔧 Troubleshooting

### Common Issues:

#### 1. "flutter command not found"
- Add Flutter to your PATH environment variable
- Restart terminal/command prompt

#### 2. "No devices found"
- Enable USB debugging on Android
- Start Android emulator
- For iOS: ensure device is trusted

#### 3. "Gradle build failed"
- Update Android SDK
- Clean project: `flutter clean && flutter pub get`

#### 4. "CocoaPods not installed" (iOS)
```bash
sudo gem install cocoapods
cd ios && pod install
```

#### 5. API not working
- Check internet connection
- Verify API key is correct
- Check TMDB API status

### Performance Issues:
```bash
# Clean build cache
flutter clean

# Get dependencies again
flutter pub get

# Run in release mode
flutter run --release
```

## 📂 Project Structure

```
lib/
├── main.dart              # App entry point
├── splash_screen.dart     # Splash screen (2s delay)
├── home_page.dart         # Bottom navigation container
├── movies_page.dart       # Movies list with TMDB API
├── favourites_page.dart   # Favorites management
├── watchlist_page.dart    # Watchlist management
├── movie_details_page.dart # Movie details view
└── movie_model.dart       # Movie data model

android/                   # Android-specific files
ios/                      # iOS-specific files
web/                      # Web-specific files
test/                     # Unit tests
```

## 🔐 Security Notes

- API key is included for demo purposes
- In production, use environment variables:
  ```dart
  const String apiKey = String.fromEnvironment('TMDB_API_KEY');
  ```
- Add `api_keys.dart` to `.gitignore`

## 🚀 Deployment

### Android Play Store:
1. Build signed APK/AAB
2. Create Play Console account
3. Upload and configure app listing

### iOS App Store:
1. Build for iOS release
2. Use Xcode to upload to App Store Connect
3. Configure app metadata

### Web Hosting:
1. Build web version: `flutter build web`
2. Deploy `build/web/` to hosting service
3. Configure routing for single-page app

## 📋 Features Checklist

- ✅ Splash screen with app logo
- ✅ Bottom navigation (Movies, Favourites, Watchlist)
- ✅ TMDB API integration
- ✅ Movie search functionality
- ✅ Add/remove favorites
- ✅ Add/remove from watchlist
- ✅ Movie details page
- ✅ Rating display with CircularProgressIndicator
- ✅ Material Design UI
- ✅ Error handling and loading states
- ✅ Image loading with fallbacks

## 🤝 Contributing

1. Fork the repository
2. Create feature branch: `git checkout -b feature-name`
3. Commit changes: `git commit -m 'Add feature'`
4. Push to branch: `git push origin feature-name`
5. Submit pull request

## 📄 License

This project is for educational purposes. TMDB API usage subject to their terms of service.