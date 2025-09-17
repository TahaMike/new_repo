import '../entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeatherOfLucknow();

  Future<WeatherEntity> getWeatherFromCoordinates(double longitude, double latitude);
}
