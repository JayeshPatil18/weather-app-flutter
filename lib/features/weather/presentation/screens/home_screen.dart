import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/weather/presentation/screens/weather_screen.dart';

import '../provider/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final city = _cityController.text;
                if (city.isNotEmpty) {
                  Provider.of<WeatherProvider>(context, listen: false).fetchWeather(city);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherScreen(city: city)),
                  );
                }
              },
              child: Text('Get Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
