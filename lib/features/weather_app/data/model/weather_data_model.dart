import 'dart:convert';

import '../../domain/entities/weather_entity.dart';

WeatherApiDataModel weatherApiDataModelFromJson(String str) => WeatherApiDataModel.fromJson(json.decode(str));

String weatherApiDataModelToJson(WeatherApiDataModel data) => json.encode(data.toJson());

class WeatherApiDataModel extends WeatherEntity {
  final CoordinatesModel? coordinates;
  final List<WeatherModel>? weather;
  final String? base;
  final MainModel? main;
  final int? visibility;
  final WindModel? wind;
  final CloudsModel? clouds;
  final int? dt;
  final SysModel? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  WeatherApiDataModel({
    this.coordinates,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherApiDataModel.fromJson(Map<String, dynamic> json) => WeatherApiDataModel(
    coordinates: json["coord"] == null ? null : CoordinatesModel.fromJson(json["coord"]),
    weather: json["weather"] == null ? [] : List<WeatherModel>.from(json["weather"]!.map((x) => WeatherModel.fromJson(x))),
    base: json["base"],
    main: json["main"] == null ? null : MainModel.fromJson(json["main"]),
    visibility: json["visibility"],
    wind: json["wind"] == null ? null : WindModel.fromJson(json["wind"]),
    clouds: json["clouds"] == null ? null : CloudsModel.fromJson(json["clouds"]),
    dt: json["dt"],
    sys: json["sys"] == null ? null : SysModel.fromJson(json["sys"]),
    timezone: json["timezone"],
    id: json["id"],
    name: json["name"],
    cod: json["cod"],
  );

  Map<String, dynamic> toJson() => {
    "coord": coordinates?.toJson(),
    "weather": weather == null ? [] : weather!.map((x) => x.toJson()).toList(),
    "base": base,
    "main": main?.toJson(),
    "visibility": visibility,
    "wind": wind?.toJson(),
    "clouds": clouds?.toJson(),
    "dt": dt,
    "sys": sys?.toJson(),
    "timezone": timezone,
    "id": id,
    "name": name,
    "cod": cod,
  };

  WeatherEntity toEntity() {
    return WeatherEntity(
      coordinatesEntity: coordinates?.toEntity(),
      weather: weather!.map((w) => w.toEntity()).toList(),
      base: base,
      main: main?.toEntity(),
      visibility: visibility,
      wind: wind?.toEntity(),
      clouds: clouds?.toEntity(),
      dt: dt,
      sys: sys?.toEntity(),
      timezone: timezone,
      id: id,
      name: name,
      cod: cod,
    );
  }
}

class CloudsModel extends CloudsEntity {
  final int? all;

  CloudsModel({this.all});

  factory CloudsModel.fromJson(Map<String, dynamic> json) => CloudsModel(all: json["all"]);

  Map<String, dynamic> toJson() => {"all": all};

  CloudsEntity toEntity() => CloudsEntity(all: all);
}

class CoordinatesModel extends CoordinatesEntity {
  final double? longitude;
  final double? latitude;

  CoordinatesModel({this.longitude, this.latitude});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) =>
      CoordinatesModel(longitude: json["lon"]?.toDouble(), latitude: json["lat"]?.toDouble());

  Map<String, dynamic> toJson() => {"lon": longitude, "lat": latitude};

  CoordinatesEntity toEntity() => CoordinatesEntity(longitudeEntity: longitude, latitudeEntity: latitude);
}

class MainModel extends MainEntity {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? groundLevel;

  MainModel({this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity, this.seaLevel, this.groundLevel});

  factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
    temp: json["temp"]?.toDouble(),
    feelsLike: json["feels_like"]?.toDouble(),
    tempMin: json["temp_min"]?.toDouble(),
    tempMax: json["temp_max"]?.toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
    seaLevel: json["sea_level"],
    groundLevel: json["grnd_level"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "humidity": humidity,
    "sea_level": seaLevel,
    "grnd_level": groundLevel,
  };

  MainEntity toEntity() => MainEntity(
    feelsLike: feelsLike,
    groundLevel: groundLevel,
    humidity: humidity,
    pressure: pressure,
    seaLevel: seaLevel,
    temp: temp,
    tempMax: tempMax,
    tempMin: tempMin,
  );
}

class SysModel extends SysEntity {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  SysModel({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory SysModel.fromJson(Map<String, dynamic> json) =>
      SysModel(type: json["type"], id: json["id"], country: json["country"], sunrise: json["sunrise"], sunset: json["sunset"]);

  Map<String, dynamic> toJson() => {"type": type, "id": id, "country": country, "sunrise": sunrise, "sunset": sunset};

  SysEntity toEntity() => SysEntity(type: type, id: id, country: country, sunrise: sunrise, sunset: sunset);
}

class WeatherModel extends WeatherDescEntity {
  final int? id;
  final String? main;
  final String? description;
  final String? weatherIcon;

  WeatherModel({this.id, this.main, this.description, this.weatherIcon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      WeatherModel(id: json["id"], main: json["main"], description: json["description"], weatherIcon: json["icon"]);

  Map<String, dynamic> toJson() => {"id": id, "main": main, "description": description, "icon": weatherIcon};

  WeatherDescEntity toEntity() => WeatherDescEntity(id: id, main: main, description: description, weatherIcon: weatherIcon);
}

class WindModel extends WindEntity {
  final double? speed;
  final int? deg;

  WindModel({this.speed, this.deg});

  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(speed: json["speed"]?.toDouble(), deg: json["deg"]);

  Map<String, dynamic> toJson() => {"speed": speed, "deg": deg};

  WindEntity toEntity() => WindEntity(speed: speed, deg: deg);
}
