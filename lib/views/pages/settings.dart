// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/search.dart';
import '../widgets/city_wheather.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());

    SearchController _controller = Get.find<SearchController>();

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              Image.asset(
                'assets/images/blur.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                color: Colors.black38,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButton(
                      onPressed: Get.back,
                      color: Colors.white,
                    ),
                    for (final city in _controller.cities)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                        child: CityWeather(city: city),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
