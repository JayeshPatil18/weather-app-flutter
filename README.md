<div align="left">
  <h1>Weather App 🌦️ - Flutter App</h1>
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" style="margin-left: 10px;">
  <img alt="Dart" src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" style="margin-left: 10px;">
  <a href="https://github.com/yourusername/weather-flutter-app">
    <img alt="GitHub" src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" style="margin-left: 10px;">
  </a>
</div>
</br>

Welcome to the **Weather Flutter App**, a simple and intuitive application to get current weather information for any city using the OpenWeatherMap API.

</br>

*Release Mode APK* [Click here](https://github.com/JayeshPatil18/weather-app-flutter/blob/master/app-release.apk)

![Available](https://github.com/JayeshPatil18/weather-app-flutter/blob/master/weather-app-flutter.png)

## Description

**Weather Flutter App** is designed to provide current weather information for a given city. Users can enter the name of the city on the home screen and view detailed weather information on the weather details screen.

## Features

- **Home Screen**: 
  - Search bar to enter the city name
  - Button to trigger the weather search
  - Loading indicator while fetching data
- **Weather Details Screen**:
  - Display city name
  - Current temperature (in Celsius)
  - Weather condition (e.g., cloudy, sunny, rainy)
  - Icon representing the weather condition
  - Humidity percentage
  - Wind speed
  - "Refresh" button to fetch updated weather data
- **Error Handling**: 
  - Display user-friendly error messages for API requests
- **State Management**: 
  - Use `Provider` to manage the app's state
- **Responsive Design**: 
  - Works on both mobile and tablet devices
- **Data Persistence**: 
  - Save the last searched city

## Technology Used

- **Flutter**: For building a beautiful, cross-platform mobile application.
- **Dart**: The programming language used with Flutter.
- **OpenWeatherMap API**: To fetch weather data.

## Project Structure

We follow a clean architecture approach to ensure a scalable and maintainable codebase. Below is an overview of our project structure:

```plaintext
lib
│
├── common
│   ├── colors
│
├── features
│   ├── weather
│       ├── data
│       │   └── repository
│       ├── domain
│       │   └── entities
│       ├── presentation
│           ├── provider
│           ├── screens
│           └── widgets
```

## Instructions

### Prerequisites

- Ensure you have Flutter version 3.22.2 installed. For installation instructions, visit [Flutter.dev](https://flutter.dev/docs/get-started/install).
- A compatible IDE (like Android Studio, IntelliJ IDEA, or Visual Studio Code) with Flutter plugins installed.

### Running the App

1. Clone this repository:

   ```bash
    git clone <repository-url>

3. Navigate into the project directory:

   ```bash
   cd weather_app_flutter

5. Install dependencies:

   ```bash
   flutter pub get

7. Run the app:

   ```bash
   flutter run

Ensure your device (emulator or physical device) is connected and running.

### Notes

- **API Key**: Replace `<YOUR_API_KEY>` in the `weather_service.dart` file with your OpenWeatherMap API key.
- **State Management**: The app uses Provider for state management. Ensure you understand Flutter's state management concepts.
- **Responsive Design**: The app's UI is basic and may need further adjustments for complex layouts.
- **Error Handling**: Customize error messages and behavior in `weather_service.dart` as needed.
- **Data Persistence**: Uses shared_preferences for storing the last searched city.
- **Refreshing Data**: Implement the refresh functionality in the weather details screen as described in the app.

## Future Improvements

- Enhance UI/UX with more detailed weather forecasts.
- Implement location-based weather using device GPS.
- Add unit tests for better reliability.

