import 'package:badmintop/ui/spash_screen.dart';
import 'package:badmintop/ui/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screeen',
      home: SplashScreen(),
    );
  }

}
