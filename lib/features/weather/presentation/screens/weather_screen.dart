import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/weather_provider.dart';

class WeatherScreen extends StatelessWidget {
  final String city;

  WeatherScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Weather Details')),
      body: Center(
        child: weatherProvider.isLoading
            ? CircularProgressIndicator()
            : weatherProvider.errorMessage != null
            ? Text(weatherProvider.errorMessage!)
            : weatherProvider.weather != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weatherProvider.weather!.cityName, style: TextStyle(fontSize: 24)),
            Text('${weatherProvider.weather!.temperature}°C', style: TextStyle(fontSize: 48)),
            Text(weatherProvider.weather!.condition, style: TextStyle(fontSize: 24)),
            Image.network('http://openweathermap.org/img/w/${weatherProvider.weather!.icon}.png'),
            Text('Humidity: ${weatherProvider.weather!.humidity}%'),
            Text('Wind Speed: ${weatherProvider.weather!.windSpeed} m/s'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                weatherProvider.fetchWeather(city);
              },
              child: Text('Refresh'),
            ),
          ],
        )
            : Text('No data'),
      ),
    );
  }
}
