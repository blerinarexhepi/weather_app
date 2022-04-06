import 'package:flutter/material.dart';
import 'package:weather_app/core/models/weather.dart';

import '../widgets/current_location.dart';
import '../widgets/slider_dots.dart';
import '../widgets/temperature.dart';
import '../widgets/weather_info.dart';

class SingleLocation extends StatelessWidget {
  final bool isActive;
  final Weather city;

  const SingleLocation({required this.city, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 150,
          ),
          Row(
            children: [
              for (int i = 0; i < 3; i++) SliderDot(isActive: isActive),
            ],
          ),
          CurrentLocation(
            currentLocation: city.cityName,
          ),
          Temperature(temp: city.temperature),
          const Divider(
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              WeatherInfo(),
              WeatherInfo(),
              WeatherInfo(),
            ],
          )
        ],
      ),
    );
  }
}
