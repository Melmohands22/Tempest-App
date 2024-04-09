import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/WeatherCubit/weatherCubit.dart';
import 'package:weather_app/Cubits/WeatherCubit/weatherStates.dart';
import 'package:weather_app/Pages/searchPage.dart';
import 'package:weather_app/widgets/noWeather.dart';
import 'package:weather_app/widgets/weatherData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffdc6b19),
        title: Text(
          'Tempest',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search, color: Colors.white),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return noWeaher();
          } else if (state is WeatherLoadedState) {
            return WeatherData(
              weatherModel: state.weatherModel,
            );
          } else {
            return const Center(
              child: Text(
                'Oops, there was an error!',
                style: TextStyle(fontSize: 30, color: Colors.red),
              ),
            );
          }
        },
      ),
    );
  }
}
