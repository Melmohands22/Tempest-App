import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Models/weatherModel.dart';

class WeatherService {
  final Dio dio;
  static const String baseUrl = 'https://api.weatherapi.com/v1';
  static const String apiKey = 'a5339d0451c04e32b5e134000240604';

  WeatherService(this.dio);
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&days=10&q=$cityName');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops there was an error';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(
        ('oops there was an error'),
      );
    }
  }
}
