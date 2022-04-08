import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/city_weather.dart';

class WeatherServices {
  Future<CityWeatherModel> getWeather({
    required bool currentLocation,
    String? city,
    String? lat,
    String? lon,
  }) async {
    final queryParameters = {
      'q': city,
      'appId': '29b03c118eb71312990a8b71c8434bce',
      'units': 'metric'
    };

    final latLonQuery = {
      'lat': lat,
      'lon': lon,
      'appId': '29b03c118eb71312990a8b71c8434bce',
      'units': 'metric'
    };

    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      currentLocation ? latLonQuery : queryParameters,
    );

    final response = await http.get(uri);

    final _res = jsonDecode(response.body);

    return CityWeatherModel.fromMap(_res);
  }
}
