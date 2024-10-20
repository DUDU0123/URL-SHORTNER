import 'package:flutter/material.dart';
import 'package:url_shortner/core/constants/navigator_key.dart';
import 'package:url_shortner/core/utils/message_show_helper.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/bloc/bloc/url_shortner_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UrlShortnerMethods {
  static void shortUrl({required TextEditingController urlController}) {
    String givenUrl = urlController.text.trim();
    givenUrl = normalizeUrl(givenUrl);
    if (givenUrl.isNotEmpty && isValidUrl(givenUrl)) {
      navigatorKey.currentContext
          ?.read<UrlShortnerBloc>()
          .add(ShortenUrlEvent(urlForShorten: givenUrl));
    } else {
      MessageShowhelper.showSnackbar(snackBarContent: 'Please enter valid url');
    }
  }

  ///this method is for normalizing url, which means if url only contains 'www.google.com', it will add https:// as prefix of this
 static String normalizeUrl(String url) {
  // Regular expression to match a domain suffix like ".com", ".org", ".co.uk", etc.
  final domainSuffixPattern = RegExp(r'\.[a-z]{2,}$', caseSensitive: false);

  // Check if the URL contains a valid domain suffix
  if (!domainSuffixPattern.hasMatch(url)) {
    return ''; // Return empty string if no valid domain suffix found
  }

  if (!url.startsWith('http://') && !url.startsWith('https://')) {
    // If the URL doesn't start with 'www.', add 'https://www.' prefix
    if (!url.startsWith('www.')) {
      return 'https://www.$url';
    }
    // Otherwise, add 'https://' as the prefix
    return 'https://$url';
  }
  return url; // Return the original URL if it starts with 'http://' or 'https://'
}


  /// this method is for checking that the given url is valid or not
  static bool isValidUrl(String url) {
    final urlPattern =
        RegExp(r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?'
            r'[a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,5}'
            r'(:[0-9]{1,5})?(\/.*)?$');
    try {
      if (urlPattern.hasMatch(url)) {
        final uri = Uri.parse(url);
        return uri.hasScheme && uri.hasAuthority;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
