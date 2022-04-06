class Weather {
  String cityName = '';
  double temperature = 0;

  Weather({
    this.cityName = '',
    this.temperature = 0,
  });

  Weather.fromMap(Map<String, dynamic> data) {
    cityName = data['name'] ?? '';
    temperature = (data['main']['temp'] ?? 0).toDouble();
    print(data['main']['temp']);
  }
}

List<Weather> weatherFromList(List<dynamic> data) {
  List<Weather> _list = [];

  for (final element in data) {
    _list.add(Weather.fromMap(element));
  }

  return _list;
}
