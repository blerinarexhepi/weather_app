// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/models/city_weather.dart';
import 'package:weather_app/views/pages/single_location.dart';

import '../../core/controllers/search.dart';
import '../widgets/appBar.dart';

class AllLocations extends StatelessWidget {
  final int initialIndex;
  const AllLocations(this.initialIndex);

  @override
  Widget build(BuildContext context) {
    final _controller = PageController(initialPage: initialIndex);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        child: CostumAppBar(),
        preferredSize: Size(double.infinity, 55),
      ),
      body: GetBuilder<SearchController>(
        init: SearchController(),
        initState: (_) {},
        builder: (controller) {
          return PageView(
            controller: _controller,
            children: [
              for (CityWeatherModel city in controller.cities)
                SingleLocation(city: city)
            ],
          );
        },
      ),
    );
  }
}
