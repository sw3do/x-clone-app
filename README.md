# X Clone - Twitter UI Clone Built with Flutter

A beautiful, fully-functional Twitter (X) clone built with Flutter featuring modern UI design, smooth animations, and all essential social media functionalities.

## 🚀 Features

### Core Functionality
- **Timeline Feed** - Browse tweets with infinite scroll and pull-to-refresh
- **Tweet Composition** - Create tweets with character counter and media options
- **User Interactions** - Like, retweet, reply, and follow functionality
- **Real-time Search** - Search for users and tweets with instant results
- **Notifications** - Like, retweet, follow, reply, and mention notifications
- **Direct Messages** - Chat interface with online status indicators
- **User Profiles** - Complete profile pages with follower counts and tweet history

### UI/UX Features
- **Dark Theme** - Authentic Twitter dark mode design
- **Smooth Animations** - Staggered loading, page transitions, and interactive elements
- **Responsive Design** - Optimized for all screen sizes
- **Touch Feedback** - Haptic feedback and visual responses
- **Loading States** - Skeleton loading and progress indicators

### Technical Features
- **Mock Data Integration** - Pre-populated with realistic data for testing
- **State Management** - Efficient state handling with proper lifecycle management
- **Navigation** - Bottom tab navigation with smooth page transitions
- **Error Handling** - Network error handling and fallback UI
- **Performance Optimized** - Lazy loading and memory management


## 🛠️ Technology Stack

- **Framework:** Flutter 3.0+
- **Language:** Dart
- **State Management:** StatefulWidget with Provider pattern
- **Navigation:** Navigator 2.0 with custom transitions
- **Animations:** Flutter Animation API
- **HTTP Client:** Built-in http package ready
- **Image Loading:** Network image with caching
- **Date Formatting:** timeago & intl packages

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  intl: ^0.20.2
  timeago: ^3.6.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/sw3do/x-clone-app.git
   cd x-clone-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (on macOS only)
flutter build ios --release
```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── data/
│   └── mock_data.dart       # Mock data for users and tweets
├── models/
│   ├── user.dart           # User data model
│   └── tweet.dart          # Tweet data model
├── screens/
│   ├── main_screen.dart    # Main navigation screen
│   ├── home_screen.dart    # Timeline feed
│   ├── search_screen.dart  # Search functionality
│   ├── notifications_screen.dart  # Notifications
│   ├── messages_screen.dart       # Direct messages
│   ├── profile_screen.dart        # User profiles
│   └── compose_tweet_screen.dart  # Tweet composition
└── widgets/
    └── tweet_widget.dart   # Reusable tweet component
```

## 🎨 Design System

The app follows Twitter's official design guidelines:

- **Colors:** Authentic Twitter blue (#1DA1F2) with dark theme
- **Typography:** System fonts with proper hierarchy
- **Spacing:** Consistent 8px grid system
- **Icons:** Material Design icons matching Twitter's style
- **Animations:** 300ms duration with easeInOut curves

## 🔧 Customization

### Adding New Features
1. Create new screen in `lib/screens/`
2. Define data models in `lib/models/`
3. Add navigation routes in `main_screen.dart`
4. Update mock data in `mock_data.dart`

### Theming
Modify theme colors in `main.dart`:
```dart
primarySwatch: Colors.blue,
primaryColor: const Color(0xFF1DA1F2),
```

### Mock Data
Update user and tweet data in `lib/data/mock_data.dart`:
```dart
static final List<User> users = [
  // Add your users here
];
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### How to Contribute
1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Style
- Follow Dart/Flutter style guidelines
- Use meaningful variable and function names
- Add comments for complex logic
- Write tests for new features

## 📝 Roadmap

- [ ] Real-time messaging
- [ ] Push notifications
- [ ] Image/video upload
- [ ] Story/Spaces features
- [ ] Advanced search filters
- [ ] Trending topics
- [ ] Analytics dashboard
- [ ] Multi-language support

## 🐛 Known Issues

- Network images may load slowly on first launch
- Some animations might skip on lower-end devices
- iOS build requires Xcode setup

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Twitter for design inspiration
- Material Design for icons and components
- Community contributors and testers

## 📞 Contact

For questions or support, please reach out:

- **Email:** sw3doo@gmail.com
- **GitHub:** [@sw3do](https://github.com/sw3do)

---

**⭐ If you found this project helpful, please give it a star!**

Made with ❤️ and Flutter
