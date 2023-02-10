import 'package:flutter/material.dart';

import 'Screen/3dobject.dart';
import 'Screen/homePage.dart';
import 'Screen/splash.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const spaceObjects(),
      // initialRoute: 'splash screen',
      // routes: {
      //   'splash screen': (context) => const Splash(),
      //   'home': (context) => const HomePage(),
      // },
    ),
  );
}
