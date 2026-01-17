# Flutter Movie App

A simple Flutter application that displays movies from TMDB API with favorites and watchlist functionality.

## Features

- **Splash Screen**: Shows app logo for 2 seconds
- **Movies Page**: Browse popular movies with search functionality
- **Favorites**: Add/remove movies to favorites
- **Watchlist**: Add/remove movies to watchlist
- **Movie Details**: View detailed information about each movie

## Setup

1. **Get TMDB API Key**:
   - Go to [TMDB](https://www.themoviedb.org/settings/api)
   - Create an account and get your API key
   - Replace `YOUR_API_KEY` in `lib/movies_page.dart` with your actual API key

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── splash_screen.dart     # Splash screen with 2s delay
├── home_page.dart         # Bottom navigation container
├── movies_page.dart       # Movies list with search and API
├── favourites_page.dart   # Favorites list
├── watchlist_page.dart    # Watchlist
├── movie_details_page.dart # Movie details view
└── movie_model.dart       # Movie data model
```

## API Configuration

The app uses TMDB API. Update the API key in `movies_page.dart`:

```dart
const String apiKey = "YOUR_ACTUAL_API_KEY_HERE";
```

## Tech Stack

- Flutter (Material Design)
- Dart
- HTTP package for API calls
- Simple setState for state management

## Note

This is a minimal implementation focusing on core functionality without complex architecture patterns.
