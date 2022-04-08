class CityWeatherModel {
  String type = '';
  int humidity = 0;
  double maxTemp = 0;
  double minTemp = 0;
  String weather = '';
  String cityName = '';
  double windSpeed = 0;
  double feelsLike = 0;
  double temperature = 0;

  CityWeatherModel({
    this.type = '',
    this.minTemp = 0,
    this.maxTemp = 0,
    this.humidity = 0,
    this.weather = '',
    this.cityName = '',
    this.feelsLike = 0,
    this.windSpeed = 0,
    this.temperature = 0,
  });

  CityWeatherModel.fromMap(Map<String, dynamic> data) {
    cityName = data['name'] ?? '';
    type = data['weather'][0]['main'] ?? '';
    humidity = data['main']['humidity'] ?? 0;
    maxTemp = (data['main']['temp_max'] ?? 0).toDouble();
    minTemp = (data['main']['temp_min'] ?? 0).toDouble();
    windSpeed = (data['wind']['speed'] ?? 0).toDouble();
    temperature = (data['main']['temp'] ?? 0).toDouble();
    feelsLike = (data['main']['feels_like'] ?? 0).toDouble();
  }
}

List<CityWeatherModel> cityWeatherFromList(List<dynamic> data) {
  List<CityWeatherModel> _list = [];

  for (final element in data) {
    _list.add(CityWeatherModel.fromMap(element));
  }

  return _list;
}
