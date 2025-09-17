import 'package:deficient_calculator/features/weather_app/presentation/provider/weather_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<WeatherProvider>().getWeatherFofLucknow();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          context.pop();
        }, icon: Icon(Icons.arrow_back_outlined)),
        title: Text('Weather App'),
        centerTitle: true,
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.weatherList.length,
            itemBuilder: (_, index) {
              final weatherDataList = value.weatherList[index];
              return Card(
                child: Text(weatherDataList.coordinatesEntity!.latitudeEntity.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
