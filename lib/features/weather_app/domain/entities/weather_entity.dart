class WeatherEntity {
  final CoordinatesEntity? coordinatesEntity;
  final List<WeatherDescEntity>? weather;
  final String? base;
  final MainEntity? main;
  final int? visibility;
  final WindEntity? wind;
  final CloudsEntity? clouds;
  final int? dt;
  final SysEntity? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  const WeatherEntity({
    this.coordinatesEntity,
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

  WeatherEntity copyWith({
    CoordinatesEntity? coordinatesEntity,
    List<WeatherDescEntity>? weather,
    String? base,
    MainEntity? main,
    int? visibility,
    WindEntity? wind,
    CloudsEntity? clouds,
    int? dt,
    SysEntity? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) => WeatherEntity(
    id: id ?? this.id,
    coordinatesEntity: coordinatesEntity ?? this.coordinatesEntity,
    weather: weather ?? this.weather,
    base: base ?? this.base,
    main: main ?? this.main,
    visibility: visibility ?? this.visibility,
    wind: wind ?? this.wind,
    clouds: clouds ?? this.clouds,
    dt: dt ?? this.dt,
    sys: sys ?? this.sys,
    timezone: timezone ?? this.timezone,
    name: name ?? this.name,
    cod: cod ?? this.cod,
  );
}

class CoordinatesEntity {
  final double? longitudeEntity;
  final double? latitudeEntity;

  const CoordinatesEntity({this.longitudeEntity, this.latitudeEntity});

  CoordinatesEntity copyWith({double? longitudeEntity, double? latitudeEntity}) =>
      CoordinatesEntity(longitudeEntity: longitudeEntity ?? this.longitudeEntity, latitudeEntity: latitudeEntity ?? this.latitudeEntity);
}

class WeatherDescEntity {
  final int? id;
  final String? main;
  final String? description;
  final String? weatherIcon;

  const WeatherDescEntity({this.id, this.main, this.description, this.weatherIcon});

  WeatherDescEntity copyWith({int? id, String? main, String? description, String? weatherIcon}) => WeatherDescEntity(
    id: id ?? this.id,
    main: main ?? this.main,
    description: description ?? this.description,
    weatherIcon: weatherIcon ?? this.weatherIcon,
  );
}

class MainEntity {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? groundLevel;

  const MainEntity({this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity, this.seaLevel, this.groundLevel});

  MainEntity copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? groundLevel,
  }) => MainEntity(
    temp: temp ?? this.temp,
    feelsLike: feelsLike ?? this.feelsLike,
    tempMin: tempMin ?? this.tempMin,
    tempMax: tempMax ?? this.tempMax,
    pressure: pressure ?? this.pressure,
    humidity: humidity ?? this.humidity,
    seaLevel: seaLevel ?? this.seaLevel,
    groundLevel: groundLevel ?? this.groundLevel,
  );
}

class WindEntity {
  final double? speed;
  final int? deg;

  const WindEntity({this.speed, this.deg});

  WindEntity copyWith({double? speed, int? deg}) => WindEntity(speed: speed ?? this.speed);
}

class CloudsEntity {
  final int? all;

  const CloudsEntity({this.all});

  CloudsEntity copyWith({int? all}) => CloudsEntity(all: all ?? this.all);
}

class SysEntity {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  const SysEntity({this.type, this.id, this.country, this.sunrise, this.sunset});

  SysEntity copyWith({int? type, int? id, String? country, int? sunrise, int? sunset}) => SysEntity(
    type: type ?? this.type,
    id: id ?? this.id,
    country: country ?? this.country,
    sunrise: sunrise ?? this.sunrise,
    sunset: sunset ?? this.sunset,
  );
}
