import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/WeatherCubit/weatherCubit.dart';
import 'package:weather_app/Models/weatherModel.dart';
import 'package:weather_app/main.dart';

class WeatherData extends StatelessWidget {
  WeatherData({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemColor(weatherModel.WeatherCondition),
          getThemColor(weatherModel.WeatherCondition)[300]!,
          getThemColor(weatherModel.WeatherCondition)[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              BlocProvider.of<GetWeatherCubit>(context).weatherModel!.CityName,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'updated at : ${weatherModel.Date.hour}:${weatherModel.Date.minute}',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network("https:${weatherModel.image}"),
                Text(
                  weatherModel.Temp.round().toString(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text('maxTemp :${weatherModel.MaxTemp.round()}'),
                    Text('minTemp :${weatherModel.minTemp.round()}'),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              weatherModel.WeatherCondition,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
