class NewsApiDomainModel {
  final String? id;
  final String? title;
  final String? description;
  final String? content;
  final String? url;
  final String? image;
  final DateTime? publishedAt;
  final String? lang;
  final SourceEntity? source;

  NewsApiDomainModel({this.id, this.title, this.description, this.content, this.url, this.image, this.publishedAt, this.lang, this.source});

  NewsApiDomainModel copyWith({
    String? id,
    String? title,
    String? description,
    String? content,
    String? url,
    String? image,
    DateTime? publishedAt,
    String? lang,
    SourceEntity? source,
  }) => NewsApiDomainModel(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    content: content ?? this.content,
    url: url ?? this.url,
    image: image ?? this.image,
    publishedAt: publishedAt ?? this.publishedAt,
    lang: lang ?? this.lang,
    source: source ?? this.source,
  );
}

class SourceEntity {
  final String? id;
  final String? name;
  final String? url;
  final String? country;

  SourceEntity({this.id, this.name, this.url, this.country});

  SourceEntity copyWith({String? id, String? name, String? url, String? country}) =>
      SourceEntity(id: id ?? this.id, name: name ?? this.name, url: url ?? this.url, country: country ?? this.country);
}
