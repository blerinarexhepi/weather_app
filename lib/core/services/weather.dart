import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/core/models/weather.dart';

class WeatherServices {
  Future<Weather> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appId': '29b03c118eb71312990a8b71c8434bce',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    print(response.body);
    return Weather.fromMap(json);
  }
}
