import '../entities/weather_entity.dart';
import '../repository/weather_app_repository.dart';

class WeatherUseCase {
  final WeatherRepository _weatherRepository;

  WeatherUseCase(this._weatherRepository);

  Future<WeatherEntity> getWeatherOfLucknow() async {
    print("Use Case hit");
    return await _weatherRepository.getWeatherOfLucknow();
  }
}
