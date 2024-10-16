import 'package:fpdart/fpdart.dart';

import 'package:url_shortner/core/error/failure.dart';
import 'package:url_shortner/core/usecase/usecase.dart';
import 'package:url_shortner/features/url_shortner_home/domain/entity/url_shortner_entity/url_shortner_entity.dart';
import 'package:url_shortner/features/url_shortner_home/domain/repository/url_shorten_repo/url_shorten_repository.dart';

class UrlShortenUsecase implements Usecase<UrlShortnerEntity,String> {
  final UrlShortenRepository urlShortenRepository;
  UrlShortenUsecase({
    required this.urlShortenRepository,
  });
  @override
  Future<Either<Failure, UrlShortnerEntity>> call({required String params}) async{
    return await urlShortenRepository.getShortenUrl(urlForShortening: params);
  }
  
}
