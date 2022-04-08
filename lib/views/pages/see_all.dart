// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/search.dart';
import '../../utils/colors.dart';
import '../widgets/city_wheather.dart';
import 'locations.dart';

class SeeAllPage extends StatelessWidget {
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
                'assets/images/blurred_snow.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                color: AppColors.black38,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButton(
                      onPressed: Get.back,
                      color: AppColors.white,
                    ),
                    for (int i = 0; i < _controller.cities.length; i++)
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Get.to(() => AllLocations(i)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                          child: CityWeather(city: _controller.cities[i]),
                        ),
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
