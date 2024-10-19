import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortner/core/common_widgets/text_widget_common.dart';
import 'package:url_shortner/core/constants/colors.dart';
import 'package:url_shortner/core/constants/height_width.dart';
import 'package:url_shortner/core/constants/navigator_key.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/bloc/bloc/url_shortner_bloc.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/utils/url_shortner_container_decoration.dart';

Widget shortenUrlShowWidget({required String shortenUrl}) {
  return Container(
    decoration: commonContainerDecoration().copyWith(
      boxShadow: [],
      gradient: LinearGradient(colors: [
        kWhite.withOpacity(0.2),
        kWhite.withOpacity(0.2),
      ]),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    width: screenWidth(context: navigatorKey.currentContext!),
    child: Row(
      children: [
        Expanded(
          child: TextWidgetCommon(
            text: 'https://quicktrim/${shortenUrl.substring(shortenUrl.length-4)}.com',
            textColor: kWhite,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.copy, color: Colors.white),
          onPressed: () {
            navigatorKey.currentContext!
                .read<UrlShortnerBloc>()
                .add(CopyToClipBoardEvent(shortenUrl: shortenUrl));
          },
          tooltip: 'Copy to clipboard',
        ),
      ],
    ),
  );
}
