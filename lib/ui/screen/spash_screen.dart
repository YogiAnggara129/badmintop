import 'package:badmintop/ui/screen/front_screen.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:badmintop/view_model/news_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }
  
  @override
  Widget build(BuildContext context) {
    GorViewModel gorViewModel = context.watch<GorViewModel>();
    gorViewModel.getGors();
    NewsViewModel newsViewModel = context.watch<NewsViewModel>();
    newsViewModel.getNews();
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    );
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      startSplashScreen();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return const FrontScreen();
        }),
      );
    });
  }
}