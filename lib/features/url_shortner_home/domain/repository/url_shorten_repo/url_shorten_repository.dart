import 'package:fpdart/fpdart.dart';
import 'package:url_shortner/core/error/failure.dart';
import 'package:url_shortner/features/url_shortner_home/domain/entity/url_shortner_entity/url_shortner_entity.dart';

abstract interface class UrlShortenRepository{
  Future<Either<Failure, UrlShortnerEntity>> getShortenUrl({required String urlForShortening,});
}