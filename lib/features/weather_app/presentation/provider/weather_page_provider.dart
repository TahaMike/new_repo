import 'package:flutter/material.dart';

import '../../domain/entities/weather_entity.dart';
import '../../domain/use_case/weather_use_case.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherUseCase _weatherUseCase;

  WeatherProvider(this._weatherUseCase);

  final List<WeatherEntity> _weatherList = [];

  List<WeatherEntity> get weatherList => _weatherList;

  Future<void> getWeatherFofLucknow() async {
    final weatherDetailsOfLucknow = await _weatherUseCase.getWeatherOfLucknow();
    _weatherList.clear();
    _weatherList.add(weatherDetailsOfLucknow);
    print(_weatherList);
    notifyListeners();
  }
}
