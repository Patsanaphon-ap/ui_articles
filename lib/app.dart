import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_articles/src/route/route_page.dart';
import 'package:ui_articles/src/route/route_path.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'articles',
        initialRoute: RoutePath.home, //default start page
        getPages: RoutePages.routes,
        unknownRoute: RoutePages.routes[0],
        transitionDuration: const Duration(milliseconds: 400),
        defaultTransition: Transition.rightToLeft,
        builder: (context, child) {
          return child!;
        },
        themeMode: ThemeMode.system);
  }
}
