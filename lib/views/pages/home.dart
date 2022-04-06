import 'package:flutter/material.dart';
import 'package:weather_app/core/controllers/search.dart';

import '../../core/controllers/home.dart';
import '../widgets/appBar.dart';
import 'single_location.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: CostumAppBar(),
        preferredSize: const Size(double.infinity, 55),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Stack(
            children: <Widget>[
              Image.asset(
                'assets/images/night.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                color: Colors.black38,
              ),
              PageView.builder(
                itemCount: Get.find<SearchController>().cities.length,
                onPageChanged: (index) => controller.onPageChanged(index),
                itemBuilder: (context, i) => SingleLocation(
                  isActive: i == controller.currentPage,
                  city: Get.find<SearchController>().cities[i],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
