import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/colors.dart';
import 'package:weather_app/features/weather/presentation/screens/weather_screen.dart';

import '../provider/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  static String searchText = '';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text('Weather App', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: secondaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          focusNode: _focusNode,
                          controller: _cityController,
                          // cursorHeight: cursorHeight,
                          cursorColor: highlightColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 16, bottom: 16, left: 20, right: 45),
                            fillColor: secondaryColor,
                            filled: true,
                            hintStyle: TextStyle(color: lightText),
                            hintText: 'Enter City Name',
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 1.0, color: highlightColor)),
                          ),
                        ),
                      ),
                      Positioned(
                          right: 8,
                          child: _cityController.text != ''
                              ? GestureDetector(
                            onTap: () {
                              _cityController.text = '';
                              setState(() {
                                HomeScreen.searchText = '';
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.only(right: 4),
                              child: Icon(Icons.close,
                                  color: lightText),
                            ),
                          )
                              : Container(
                            padding: EdgeInsets.only(right: 4),
                            child: Icon(Icons.search,
                                color: _focusNode.hasFocus
                                    ? highlightColor
                                    : lightText),
                          )),

                      // Positioned(
                      //     right: 8,
                      //     child: CircleIconContainer(
                      //         icon: const Icon(Icons.search,
                      //             color: AppColors.primaryColor30),
                      //         containerColor: AppColors.secondaryColor10,
                      //         containerSize: 40)),
                    ],
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80),
                  child: Image.asset('assets/img/forecast.png', height: 250,)),
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
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text('Get Weather', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: highlightColor,
                padding: EdgeInsets.symmetric(vertical: 14),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
