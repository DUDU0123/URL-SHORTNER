part of 'url_shortner_bloc.dart';

sealed class UrlShortnerState extends Equatable {
  const UrlShortnerState();
  @override
  List<Object> get props => [];
}

final class UrlShortnerInitial extends UrlShortnerState {}

class UrlShortenSuccessState extends UrlShortnerState {
  final String shortenUrl;
  const UrlShortenSuccessState({
    required this.shortenUrl,
  });
  @override
  List<Object> get props => [
        shortenUrl,
      ];
}

class UrlShortenErrorState extends UrlShortnerState {
  final String message;
  const UrlShortenErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [
        message,
      ];
}
