import 'package:flutter/material.dart';
import 'package:url_shortner/config/routes/routes_name.dart';
import 'package:url_shortner/features/intro/intro_splash_screen.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/pages/url_shortner_home.dart';

class AppRoutes{
  static  Map<String, Widget Function(BuildContext)> routes = {
    AppRoutesName.homePage : (context)=> const UrlShortnerHome(),
    AppRoutesName.introPage : (context)=>  const IntroSplashScreen(),
  };
}