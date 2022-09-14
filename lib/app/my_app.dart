import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:task/presentation/resources/routes_manager.dart';
import 'package:task/presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: getAppTheme(),
      onGenerateRoute: RoutesGenerator.generateRoute,
      initialRoute: Routes.registerRoute,
    );
  }
}
