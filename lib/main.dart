import 'package:flutter/material.dart';
import 'package:url_shortner/core/service_locator/service_locator.dart';
import 'package:url_shortner/features/root_widget_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const RootWidgetPage());
}
