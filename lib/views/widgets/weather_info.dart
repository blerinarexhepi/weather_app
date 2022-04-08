// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class WeatherInfo extends StatelessWidget {
  final int number;
  final String unit;
  final String description;

  const WeatherInfo({
    required this.unit,
    required this.number,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.white,
          ),
        ),
        Text(
          '$number$unit',
          style: const TextStyle(
            fontSize: 25,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
