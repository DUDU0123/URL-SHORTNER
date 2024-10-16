import 'package:equatable/equatable.dart';

class UrlShortnerEntity extends Equatable {
  final String? id;
  final String? shortenUrl;
  final String? originalUrl;
  final int? visitedCount;
  const UrlShortnerEntity({
    this.id,
    this.shortenUrl,
    this.originalUrl,
    this.visitedCount,
  });

  @override
  List<Object?> get props => [
        id,
        shortenUrl,
        originalUrl,
        visitedCount,
      ];
}
