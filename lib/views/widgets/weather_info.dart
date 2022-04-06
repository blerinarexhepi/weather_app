import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Wind',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        Text(
          '10',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        Text(
          'km/h',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
