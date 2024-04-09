class WeatherModel {
  final String CityName;
  final DateTime Date;
  final String image;
  final double Temp;
  final double MaxTemp;
  final double minTemp;
  final String WeatherCondition;

  WeatherModel({
    required this.CityName,
    required this.Date,
    required this.image,
    required this.Temp,
    required this.MaxTemp,
    required this.minTemp,
    required this.WeatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      CityName: json['location']['name'],
      Date: DateTime.parse(json['current']['last_updated']),
      Temp: json['current']['temp_c'],
      MaxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      WeatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
