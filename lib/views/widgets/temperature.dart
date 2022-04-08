// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Temperature extends StatelessWidget {
  final double temp;
  final String weatherType;
  final double feelsLikeTemp;

  const Temperature({
    required this.temp,
    required this.weatherType,
    required this.feelsLikeTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${temp.round()}\u2103',
          style: const TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              // 'assets/icons/rain.svg',
              'assets/icons/${weatherType.toLowerCase()}.svg',
              width: 45,
            ),
            Text(
              'Today: $weatherType. Feels like: ${feelsLikeTemp.round()}\u2103',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
