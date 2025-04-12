# 🎬 MusicPlayer Flutter App

A cross-platform Flutter app that allows users to browse movies and showtimes for Youtube Cinemas in real-time. Built with a single codebase for Android, iOS, and Web using Flutter and Dart.

---

## 🚀 Features

- 🎞 Browse movies and showtimes in real-time
- 🧩 Filter by genre, language, and age rating
- 🧱 Grid-based movie view for easy browsing
- 🕐 View daily and specific time show schedules
- 🎬 Detailed movie information (trailers, images, cast)
- 🧠 Redux for state management
- 🌍 Multiple language support (i18n)
- ✅ Includes automated widget and integration tests
- 💡 Intuitive and modern UI

---

## 🧾 Tech Stack

- **Flutter** (Android, iOS, Web)
- **Dart**
- **Redux** for state management
- **url_launcher** for trailer viewing
- **flutter_localizations** for i18n

---

## 📁 Project Structure

    # lib/ ├── main.dart 
    # Entry point ├── app.dart 
    # App configuration ├── models/ 
    # Data models (Movie) ├── views/ 
    # UI screens (home_view, movie_detail) ├── widgets/ 
    # Reusable components (movie_grid) ├── redux/ 
    # Redux setup (actions, reducers, store) ├── services/ 
    # API simulation (api_service.dart) ├── localization/ 
    # Internationalization setup ├── utils/ 
    # Utility functions (optional) test/ 
    # Unit and widget tests


---

## 🛠 Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/musicplayer_flutter_app.git
   cd musicplayer_flutter_app

2. **Install dependencies**
    ```bash
    flutter pub get

3. **Run the app**
    ```bash
    flutter run

4. **Build for web**
    ```bash
    flutter build web

## 🌐 Localization

**Supported languages:**

English (en)

Spanish (es)

French (fr)

## ✅ Testing

Run all tests using:

    flutter test

# 📦 Dependencies

flutter_redux

url_launcher

flutter_localizations

## 📄 License
MIT License © Jsrrsoft