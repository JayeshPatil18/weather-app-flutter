import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/colors.dart';

import '../provider/weather_provider.dart';

class WeatherScreen extends StatelessWidget {
  final String city;

  WeatherScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin:
        const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
        child: Container(
          height: 55,
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              weatherProvider.fetchWeather(city);
            },
            icon: Icon(Icons.refresh, color: Colors.white),
            label: Text('Refresh', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: highlightColor,
              padding: EdgeInsets.symmetric(horizontal: 10),
              textStyle: TextStyle(fontSize: 18),
            ),
          )
        ),
      ),
      appBar: AppBar(
        title: Text('Weather Report', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        backgroundColor: secondaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Change back button color here
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(14)
          ),
          margin: EdgeInsets.only(bottom: 200, top: 30, left: 30, right: 30),
          child: weatherProvider.isLoading
              ? CircularProgressIndicator(color: highlightColor)
              : weatherProvider.errorMessage != null
              ? Text(
            weatherProvider.errorMessage!,
            style: TextStyle(color: Colors.red, fontSize: 18),
          )
              : weatherProvider.weather != null
              ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Text(
                    weatherProvider.weather!.cityName,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${weatherProvider.weather!.temperature}°C',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'http://openweathermap.org/img/w/${weatherProvider.weather!.icon}.png',
                        scale: 0.6, // Increase the size of the weather icon
                      ),
                      SizedBox(width: 10),
                      Text(
                        weatherProvider.weather!.condition,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Humidity:',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              '${weatherProvider.weather!.humidity}%',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Wind Speed:',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              '${weatherProvider.weather!.windSpeed} m/s',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          )
              : Text(
            'No data available',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
