import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/WeatherCubit/weatherCubit.dart';
import 'package:weather_app/Models/weatherModel.dart';
import 'package:weather_app/services/weatherService.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff8f6e3),
        appBar: AppBar(
          backgroundColor: Color(0xff97e7e1),
          title: const Text(
            'Search a City',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Center(
                child: TextField(
                    onSubmitted: (value) async {
                      WeatherModel weatherModel = await WeatherService(Dio())
                          .getWeather(cityName: value);
                      var getWeatherCubit =
                          BlocProvider.of<GetWeatherCubit>(context);
                      getWeatherCubit.getForecast(cityName: value);
                      Navigator.pop(context);
                    },
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                        border: OutlineInputBorder(),
                        hintText: 'Enter City Name',
                        label: Text('Search'),
                        suffixIcon: Icon(Icons.search))))));
  }
}
