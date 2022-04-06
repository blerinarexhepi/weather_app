import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/models/weather.dart';
import 'package:weather_app/views/pages/home.dart';
import 'package:weather_app/views/pages/settings.dart';

import '../services/weather.dart';

class SearchController extends GetxController {
  Weather city = Weather();
  RxBool hasValue = false.obs;
  RxList<Weather> cities = <Weather>[].obs;

  TextEditingController searchController = TextEditingController();

  void searchCity() async {
    try {
      bool newCity = false;
      city = await WeatherServices().getWeather(searchController.text);

      print(cities.contains(city.cityName));
      if (cities.contains(city.cityName))
        newCity = false;
      else
        newCity = true;

      if (cities.isEmpty || newCity) cities.add(city);

      cities.refresh();
      print(cities.length);

      update();

      Get.to(() => HomePage());
    } catch (e) {
      print(e);
    }
  }
}
