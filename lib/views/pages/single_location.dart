// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../core/models/city_weather.dart';
import '../../utils/colors.dart';
import '../widgets/current_location.dart';
import '../widgets/temperature.dart';
import '../widgets/weather_info.dart';

class SingleLocation extends StatelessWidget {
  final CityWeatherModel city;

  const SingleLocation({required this.city});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/${city.type.toLowerCase()}.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          color: AppColors.black38,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              CurrentLocation(
                currentLocation: city.cityName,
              ),
              Temperature(
                temp: city.temperature,
                weatherType: city.type,
                feelsLikeTemp: city.feelsLike,
              ),
              const Divider(
                color: Colors.white,
              ),
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherInfo(
                      unit: '\u2103',
                      description: 'Min',
                      number: city.minTemp.round(),
                    ),
                    WeatherInfo(
                      unit: '\u2103',
                      description: 'Max',
                      number: city.maxTemp.round(),
                    ),
                    WeatherInfo(
                      unit: 'km/h',
                      description: 'Wind',
                      number: city.windSpeed.round(),
                    ),
                    WeatherInfo(
                      unit: '%',
                      number: city.humidity,
                      description: 'Humidity',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
