import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../views/pages/home.dart';
import '../models/weather.dart';
import '../services/weather.dart';

class SearchController extends GetxController {
  Weather city = Weather();
  RxBool hasValue = false.obs;
  RxList<Weather> cities = <Weather>[].obs;

  TextEditingController searchController = TextEditingController();

  void searchCity(
      {bool currentLocation = false, String? lat, String? lon}) async {
    try {
      bool newCity = false;
      city = await WeatherServices().getWeather(
        currentLocation: currentLocation,
        city: searchController.text,
        lat: lat,
        lon: lon,
      );

//fix this
      newCity = !cities.contains(city);

      if (cities.isEmpty || newCity) {
        cities.add(city);
        cities.reversed;
      }

      update();

      Get.to(() => HomePage());
    } catch (e) {
      print(e);
    }
  }
}
