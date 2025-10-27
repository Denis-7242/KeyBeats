# 🎵 KeyBeats Music Player

A beautiful, modern Flutter music player app with an elegant dark theme and smooth UI animations.

## ✨ Features

- **Beautiful Dark Theme** - Deep purple, navy blue gradients with pink/blue accents
- **Multiple Screens** - Home, Now Playing, Playlists, and Library
- **Smooth Animations** - Rotating album art, glowing play button, fade transitions
- **Custom Widgets** - Reusable song cards and player controls
- **Bottom Navigation** - Easy switching between screens
- **Mock Data** - 8 dummy songs and 6 playlists for testing
- **Responsive Design** - Works beautifully on both Android and iOS

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── theme/
│   └── app_theme.dart          # Color palette and theme configuration
├── models/
│   └── song_model.dart         # Song and Playlist models with mock data
├── screens/
│   ├── splash_screen.dart      # Animated splash screen
│   ├── home_screen.dart        # Main home screen with song list
│   ├── now_playing_screen.dart # Full-screen player interface
│   └── playlist_screen.dart    # Playlist grid view
└── widgets/
    ├── song_card.dart          # Custom song card widget
    └── player_controls.dart    # Player control buttons with animations
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.17.0 or higher)
- Android Studio / VS Code with Flutter extensions
- An Android emulator or iOS simulator

### Installation

1. **Create a new Flutter project:**
```bash
flutter create keybeats
cd keybeats
```

2. **Copy all the files** from this artifact into your project following the folder structure above.

3. **Update `pubspec.yaml`:**
```yaml
name: keybeats
description: A modern music player app

environment:
  sdk: '>=2.17.0 <3.0.0'

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
```

4. **Get dependencies:**
```bash
flutter pub get
```

5. **Run the app:**
```bash
flutter run
```

## 🎨 Design Highlights

### Color Palette
- **Primary Dark**: `#0A0E27` - Deep navy background
- **Secondary Dark**: `#1A1F3A` - Card backgrounds
- **Accent Purple**: `#6C63FF` - Primary accent color
- **Accent Pink**: `#E91E63` - Secondary accent for gradients
- **Accent Blue**: `#00BCD4` - Tertiary accent

### UI Elements
- **Rounded Corners** - 15px for cards, 12px for buttons
- **Soft Shadows** - Subtle elevation for depth
- **Gradient Backgrounds** - Smooth transitions between colors
- **Smooth Animations** - 300-1500ms durations with curves
- **Hero Animations** - Album art transitions between screens

## 📱 Screens Overview

### 1. Splash Screen
- Animated logo with fade and scale effects
- Gradient background
- Auto-navigates to Home after 3 seconds

### 2. Home Screen
- Personalized greeting based on time of day
- Recently played songs list
- Bottom navigation bar
- Library section with quick access options

### 3. Now Playing Screen
- Full-screen album art with rotation animation
- Progress bar with time indicators
- Play/pause with glowing animation effect
- Favorite button
- Previous/Next controls
- Shuffle and repeat options

### 4. Playlist Screen
- Grid layout for playlists
- Create new playlist button
- Song count for each playlist
- Beautiful cover images

## 🔧 Customization

### Adding Your Own Songs

Edit `lib/models/song_model.dart` and modify the `getSongs()` method:

```dart
Song(
  id: 'unique_id',
  title: 'Your Song Title',
  artist: 'Artist Name',
  album: 'Album Name',
  duration: '3:45',
  coverUrl: 'https://your-image-url.com/image.jpg',
)
```

### Changing Colors

Edit `lib/theme/app_theme.dart` to customize the color palette:

```dart
static const Color accentPurple = Color(0xFFYourColor);


