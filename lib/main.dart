import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/WeatherCubit/weatherCubit.dart';
import 'package:weather_app/Models/weatherModel.dart';
import 'package:weather_app/Pages/homePage.dart';

void main() {
  runApp(const Tempest());
}

class Tempest extends StatefulWidget {
  const Tempest({super.key});

  @override
  State<Tempest> createState() => _TempestState();
}

class _TempestState extends State<Tempest> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage(),
              theme: ThemeData(
                primarySwatch: getThemColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.WeatherCondition,
                ),
              )),
        ));
  }
}

MaterialColor getThemColor(String? WeatherCondition) {
  if (WeatherCondition == null) {
    return Colors.blue;
  } else if (WeatherCondition ==
      'Sunny'
          'Clear'
          'partly cloudy') {
    return Colors.blue;
  } else if (WeatherCondition ==
      'Blizzard'
          'Patchy snow possible'
          'Patchy sleet possible'
          'Patchy freezing drizzle possible'
          'Blowing snow') {
    return Colors.blue;
  } else if (WeatherCondition ==
      'Freezing fog'
          'Fog'
          'Heavy Cloud'
          'Mist'
          'Fog') {
    return Colors.blueGrey;
  } else if (WeatherCondition ==
      'Patchy rain possible'
          'Patchy rain nearby'
          'Heavy Rain'
          'Showers	'
          'Moderate rain') {
    return Colors.blue;
  } else if (WeatherCondition ==
      'Thundery outbreaks possible'
          'Moderate or heavy snow with thunder'
          'Patchy light snow with thunder'
          'Moderate or heavy rain with thunder'
          'Patchy light rain with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.orange;
  }
}
