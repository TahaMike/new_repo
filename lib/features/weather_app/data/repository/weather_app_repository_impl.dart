import 'dart:convert';

import '../../../../core/constant/api_constant.dart';
import '../../../../core/services/weather_api_service.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repository/weather_app_repository.dart';
import '../model/weather_data_model.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  @override
  Future<WeatherEntity> getWeatherOfLucknow() async {
    final response = await WeatherApiService.instance.get(ApiConstant.lucknowWeatherApiUrl);
    if (response.statusCode != 200) throw response.body ?? 'something went wrong';
    final decodedData = jsonDecode(response.body);
    final weatherModel = WeatherApiDataModel.fromJson(decodedData);
    return weatherModel.toEntity();
  }

  @override
  Future<WeatherEntity> getWeatherFromCoordinates(double longitude, double latitude) {
    // TODO: implement getWeatherFromCoordinates
    throw UnimplementedError();
  }
}
