import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/colors.dart';

import 'features/weather/presentation/provider/weather_provider.dart';
import 'features/weather/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: mainAppColor,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
