import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/models/weather.dart';
import '../pages/home.dart';

class CityWeather extends StatelessWidget {
  final Weather city;

  CityWeather({required this.city});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          // onTap: () => Get.to(
          //   () => (HomePage()),
          // ),
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/snow.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/sunny.svg',
                      fit: BoxFit.scaleDown,
                      width: 30,
                      color: Colors.white,
                    ),
                    Text(
                      city.cityName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${city.temperature.round()}\u2103',
                  style: const TextStyle(
                    color: Colors.white,
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
          color: Colors.white,
        )
      ],
    );
  }
}
