import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortner/core/constants/navigator_key.dart';
import 'package:url_shortner/core/service_locator/service_locator.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/bloc/bloc/url_shortner_bloc.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/pages/url_shortner_home.dart';

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<UrlShortnerBloc>(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const UrlShortnerHome(),
      ),
    );
  }
}
