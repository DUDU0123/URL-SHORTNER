import 'package:get_it/get_it.dart';
import 'package:url_shortner/features/url_shortner_home/data/data_source/url_shorten_data/url_shorten_data.dart';
import 'package:url_shortner/features/url_shortner_home/data/repository/url_shorten_repo/url_shorten_repository_impl.dart';
import 'package:url_shortner/features/url_shortner_home/domain/repository/url_shorten_repo/url_shorten_repository.dart';
import 'package:url_shortner/features/url_shortner_home/domain/usecase/url_shorten_usecase.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/bloc/bloc/url_shortner_bloc.dart';
import 'package:http/http.dart' as http;

GetIt serviceLocator = GetIt.instance;

void initDependencies() {
  serviceLocator.registerFactory<http.Client>(
    () => http.Client(),
  );
  initUrlShortenDependencies();
}

void initUrlShortenDependencies() {
  serviceLocator
    ..registerFactory<UrlShortenData>(
      () => UrlShortenDataImpl(client: serviceLocator<http.Client>()),
    )
    ..registerFactory<UrlShortenRepository>(
      () => UrlShortenRepositoryImpl(
        urlShortenData: serviceLocator<UrlShortenData>(),
      ),
    )
    ..registerFactory<UrlShortenUsecase>(
      () => UrlShortenUsecase(
        urlShortenRepository: serviceLocator<UrlShortenRepository>(),
      ),
    )
    ..registerLazySingleton<UrlShortnerBloc>(
      () => UrlShortnerBloc(
        urlShortenUsecase: serviceLocator<UrlShortenUsecase>(),
      ),
    );
}
