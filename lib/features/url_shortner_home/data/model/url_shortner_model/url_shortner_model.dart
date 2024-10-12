import 'package:url_shortner/features/url_shortner_home/domain/entity/url_shortner_entity/url_shortner_entity.dart';

class UrlShortnerModel extends UrlShortnerEntity {
  const UrlShortnerModel({
    super.id,
    super.originalUrl,
    super.shortenUrl,
    super.visitedCount,
  });

  factory UrlShortnerModel.fromJson(Map<String, dynamic> json) {
    return UrlShortnerModel(
      id: json['id'] as String?,
      originalUrl: json['originalUrl'] as String?,
      shortenUrl: json['shortenUrl'] as String?,
      visitedCount: (json['visitedCount'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'originalUrl': originalUrl,
      'shortenUrl': shortenUrl,
      'visitedCount': visitedCount,
    };
  }

  UrlShortnerModel copyWith({
    String? id,
    String? originalUrl,
    String? shortenUrl,
    List<String>? visitedCount,
  }) {
    return UrlShortnerModel(
      id: id ?? this.id,
      originalUrl: originalUrl ?? this.originalUrl,
      shortenUrl: shortenUrl ?? this.shortenUrl,
      visitedCount: visitedCount ?? this.visitedCount,
    );
  }
}
