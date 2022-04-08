import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/functions/snackbars.dart';
import '../../views/pages/locations.dart';
import '../models/city_weather.dart';
import '../services/weather.dart';

class SearchController extends GetxController {
  CityWeatherModel weatherCity = CityWeatherModel();
  RxBool hasValue = false.obs;
  RxList<CityWeatherModel> cities = <CityWeatherModel>[].obs;

  TextEditingController searchController = TextEditingController();

  void searchCity(
      {bool currentLocation = false, String? lat, String? lon}) async {
    try {
      bool newCity = true;

      weatherCity = await WeatherServices().getWeather(
        currentLocation: currentLocation,
        city: searchController.text,
        lat: lat,
        lon: lon,
      );

      for (final city in cities) {
        if (city.cityName == weatherCity.cityName) newCity = false;
      }

      if (cities.isEmpty || newCity) {
        cities.add(weatherCity);
      }

      update();

      searchController.clear();
      Get.offAll(() => AllLocations(cities.length));
    } catch (e) {
      errorSnackbar(message: 'Please try again a different city!');
    }
  }
}
