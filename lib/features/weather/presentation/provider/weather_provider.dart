import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/weather_model.dart';
import '../../domain/repository/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weather;
  bool _isLoading = false;
  String? _errorMessage;
  String? _lastCity;

  WeatherModel? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get lastCity => _lastCity;

  final WeatherService _weatherService = WeatherService();

  WeatherProvider() {
    _loadLastCity();
  }

  Future<void> _loadLastCity() async {
    final prefs = await SharedPreferences.getInstance();
    _lastCity = prefs.getString('lastCity');
    if (_lastCity != null) {
      fetchWeather(_lastCity!);
    }
  }

  Future<void> _saveLastCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lastCity', city);
  }

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final data = await _weatherService.fetchWeather(city);
      _weather = WeatherModel.fromJson(data);
      _lastCity = city;
      await _saveLastCity(city);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
