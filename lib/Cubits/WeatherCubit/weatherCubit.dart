import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/WeatherCubit/weatherStates.dart';
import 'package:weather_app/Models/weatherModel.dart';
import 'package:weather_app/services/weatherService.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getForecast({required String cityName}) async {
    try {
      weatherModel = await WeatherService(Dio()).getWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
