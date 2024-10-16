import 'package:flutter/material.dart';
import 'package:url_shortner/core/common_widgets/text_widget_common.dart';
import 'package:url_shortner/core/constants/colors.dart';
import 'package:url_shortner/core/constants/height_width.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/utils/url_shortner_container_decoration.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/utils/url_shortner_methods.dart';

class UrlShortnerContainerWidget extends StatefulWidget {
  const UrlShortnerContainerWidget({
    super.key,
  });

  @override
  State<UrlShortnerContainerWidget> createState() =>
      _UrlShortnerContainerWidgetState();
}

class _UrlShortnerContainerWidgetState
    extends State<UrlShortnerContainerWidget> {
  TextEditingController urlController = TextEditingController();

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: screenHeight(context: context) / 2.8,
      decoration: commonContainerDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TextWidgetCommon(
            letterSpacing: 1.2,
            text: "QuickTrim",
            textColor: kWhite,
            fontSize: 28,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
          kHeight25,
          TextField(
            cursorColor: kWhite,
            controller: urlController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter your URL here',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              prefixIcon: const Icon(Icons.link, color: Colors.white70),
              filled: true,
              fillColor: Colors.white.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
          kHeight25,
          ElevatedButton(
            onPressed: () {
              UrlShortnerMethods.shortUrl(urlController: urlController);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.purple.shade800,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
            ),
            child: const TextWidgetCommon(
              fontSize: 20,
              text: "Shorten",fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}