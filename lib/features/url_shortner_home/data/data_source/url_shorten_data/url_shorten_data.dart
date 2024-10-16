import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:url_shortner/core/api/endpoints.dart';

import 'package:url_shortner/core/exception/exception.dart';
import 'package:url_shortner/features/url_shortner_home/data/model/url_shortner_model/url_shortner_model.dart';

abstract interface class UrlShortenData {
  Future<UrlShortnerModel> getShortenUrl({required String urlForShortening});
}

class UrlShortenDataImpl implements UrlShortenData {
  final http.Client client;
  UrlShortenDataImpl({
    required this.client,
  });
  @override
  Future<UrlShortnerModel> getShortenUrl(
      {required String urlForShortening}) async {
    try {
      log("Heelo I'm inside");
      final response =
          await client.post(Uri.parse('${EndPoints.baseUrl}/url/'), body: {
        'url': urlForShortening,
      });
      print(response);
      log(response.body.toString());
      final decodedData = jsonDecode(response.body);
      log("Decoded: $decodedData");
      return UrlShortnerModel.fromJson(decodedData);
    } catch (e, stackTrace) {
      log(name: "Error $stackTrace", e.toString());
      throw ServerException(message: e.toString());
    }
  }
}
