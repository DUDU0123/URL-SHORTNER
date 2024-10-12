import 'package:url_shortner/core/exception/exception.dart';
import 'package:url_shortner/features/url_shortner_home/data/model/url_shortner_model/url_shortner_model.dart';

abstract interface class UrlShortenData{
  Future<UrlShortnerModel> getShortenUrl();
}

class UrlShortenDataImpl implements UrlShortenData{
  @override
  Future<UrlShortnerModel> getShortenUrl() async{
    try {
      return UrlShortnerModel();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  
}