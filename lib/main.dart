import 'package:badmintop/ui/screen/spash_screen.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GorViewModel>(create: (_) => GorViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BadminTop',
        home: SplashScreen(),
      ),
    );
  }
}
