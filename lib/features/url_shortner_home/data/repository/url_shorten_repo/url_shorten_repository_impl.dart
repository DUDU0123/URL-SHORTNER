import 'package:fpdart/fpdart.dart';
import 'package:url_shortner/core/error/failure.dart';
import 'package:url_shortner/core/exception/exception.dart';
import 'package:url_shortner/features/url_shortner_home/data/data_source/url_shorten_data/url_shorten_data.dart';
import 'package:url_shortner/features/url_shortner_home/data/model/url_shortner_model/url_shortner_model.dart';
import 'package:url_shortner/features/url_shortner_home/domain/entity/url_shortner_entity/url_shortner_entity.dart';
import 'package:url_shortner/features/url_shortner_home/domain/repository/url_shorten_repo/url_shorten_repository.dart';

class UrlShortenRepositoryImpl implements UrlShortenRepository {
  final UrlShortenData urlShortenData;
  UrlShortenRepositoryImpl({
    required this.urlShortenData,
  });
  @override
  Future<Either<Failure, UrlShortnerEntity>> getShortenUrl({required String urlForShortening,}) async{
    try {
      final UrlShortnerModel result = await urlShortenData.getShortenUrl(urlForShortening: urlForShortening,);
      return right(result);
    }on ServerException catch (e) {
      return left(Failure(message: e.message));
    }catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
