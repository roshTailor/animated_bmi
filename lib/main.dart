import 'package:flutter/material.dart';
import 'Screen/homePage.dart';
import 'Screen/splash.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const spaceObjects(),
      initialRoute: 'splash screen',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      routes: {
        'splash screen': (context) => const Splash(),
        'home': (context) => const HomePage(),
      },
    ),
  );
}
