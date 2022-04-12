import 'package:badmintop/ui/screen/spash_screen.dart';
import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/ui/widget/bottom_nav_data.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BadminTop',
      home: SplashScreen(),
    );
  }

}
