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
      appBar: AppBar(
        title: Text('Weather Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: weatherProvider.isLoading
            ? CircularProgressIndicator()
            : weatherProvider.errorMessage != null
            ? Text(
          weatherProvider.errorMessage!,
          style: TextStyle(color: Colors.red, fontSize: 18),
        )
            : weatherProvider.weather != null
            ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  weatherProvider.weather!.cityName,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '${weatherProvider.weather!.temperature}°C',
                  style: TextStyle(fontSize: 64, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'http://openweathermap.org/img/w/${weatherProvider.weather!.icon}.png',
                      scale: 0.8,
                    ),
                    SizedBox(width: 10),
                    Text(
                      weatherProvider.weather!.condition,
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Humidity:', style: TextStyle(fontSize: 18)),
                          Text('${weatherProvider.weather!.humidity}%', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Wind Speed:', style: TextStyle(fontSize: 18)),
                          Text('${weatherProvider.weather!.windSpeed} m/s', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {
                    weatherProvider.fetchWeather(city);
                  },
                  icon: Icon(Icons.refresh),
                  label: Text('Refresh'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        )
            : Text(
          'No data available',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
