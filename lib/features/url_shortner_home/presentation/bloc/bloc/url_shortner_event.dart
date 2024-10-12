part of 'url_shortner_bloc.dart';

sealed class UrlShortnerEvent extends Equatable {
  const UrlShortnerEvent();
  @override
  List<Object> get props => [];
}

class ShortenUrlEvent extends UrlShortnerEvent {
  final String urlForShorten;
  const ShortenUrlEvent({
    required this.urlForShorten,
  });
  @override
  List<Object> get props => [
        urlForShorten,
      ];
}
class CopyToClipBoardEvent extends UrlShortnerEvent {
  final String shortenUrl;
  const CopyToClipBoardEvent({
    required this.shortenUrl,
  });
  @override
  List<Object> get props => [
        shortenUrl,
      ];
}
