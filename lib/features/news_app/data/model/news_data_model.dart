// To parse this JSON data, do
//
//     final newsApiDataModel = newsApiDataModelFromJson(jsonString);
import 'package:deficient_calculator/features/news_app/domain/entities/news_entity_model.dart';

class NewsApiDataModel extends NewsApiDomainModel{
  final String? id;
  final String? title;
  final String? description;
  final String? content;
  final String? url;
  final String? image;
  final DateTime? publishedAt;
  final String? lang;
  final SourceModel? sourceModel;

  NewsApiDataModel({this.id, this.title, this.description, this.content, this.url, this.image, this.publishedAt, this.lang, this.sourceModel});

  factory NewsApiDataModel.fromJson(Map<String, dynamic> json) => NewsApiDataModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    content: json["content"],
    url: json["url"],
    image: json["image"],
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    lang: json["lang"],
    sourceModel: json["source"] == null ? null : SourceModel.fromJson(json["source"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "content": content,
    "url": url,
    "image": image,
    "publishedAt": publishedAt?.toIso8601String(),
    "lang": lang,
    "source": sourceModel?.toJson(),
  };

  NewsApiDomainModel toEntity() => NewsApiDomainModel(
    id: id,
    title: title,
    description: description,
    content: content,
    url: url,
    image: image,
    publishedAt: publishedAt,
    lang: lang,
    source: sourceModel?.toEntity(),
  );
}

class SourceModel {
  final String? id;
  final String? name;
  final String? url;
  final String? country;

  SourceModel({this.id, this.name, this.url, this.country});

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {"id": id, "name": name, "url": url, "country": country};
  SourceEntity toEntity() => SourceEntity(id: id, name: name, url: url, country: country);
}
