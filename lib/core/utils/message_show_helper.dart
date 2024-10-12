import 'package:flutter/material.dart';
import 'package:url_shortner/core/common_widgets/text_widget_common.dart';
import 'package:url_shortner/core/constants/colors.dart';
import 'package:url_shortner/core/constants/navigator_key.dart';

class MessageShowhelper {
 static void showDialogBox({
    required String dialogTitle,
    required String dialogContent,
    required String actionButtonName,
    required void Function()? buttonActionMethod,
  }) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: TextWidgetCommon(
          text: dialogTitle,
          fontSize: 18,
        ),
        content: TextWidgetCommon(
          fontSize: 16,
          text: dialogContent,
        ),
        actions: [
          commonTextButton(
            buttonActionMethod: () {
              navigatorKey.currentState?.pop();
            },
            buttonText: 'Cancel',
          ),
          commonTextButton(
            buttonActionMethod: buttonActionMethod,
            buttonText: actionButtonName,
          ),
        ],
      ),
    );
  }

 static void showSnackbar({
    required String snackBarContent,
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!)..hideCurrentSnackBar()..showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        behavior: SnackBarBehavior.floating,
        content: TextWidgetCommon(
          text: snackBarContent,textColor: kWhite,
          fontSize: 16,
        ),
        backgroundColor: kBlack.withOpacity(0.3),
        duration: const Duration(milliseconds: 700,),
      ),
    );
  }
}
Widget commonTextButton({
  required String buttonText,
  required void Function()? buttonActionMethod,
}) {
  return TextButton(
    onPressed: buttonActionMethod,
    child: TextWidgetCommon(
      fontSize: 18,
      text: buttonText,
    ),
  );
}