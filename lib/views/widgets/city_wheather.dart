import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/models/city_weather.dart';
import '../../utils/colors.dart';

class CityWeather extends StatelessWidget {
  final CityWeatherModel city;

  CityWeather({required this.city});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/${city.type.toLowerCase()}.svg',
                      fit: BoxFit.scaleDown,
                      width: 30,
                    ),
                    Text(
                      city.cityName,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${city.temperature.round()}\u2103',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 0,
          thickness: 1,
          color: AppColors.white,
        )
      ],
    );
  }
}
