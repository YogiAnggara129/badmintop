import 'package:badmintop/ui/screen/explore_screen.dart';
import 'package:badmintop/ui/screen/home_screen.dart';
import 'package:badmintop/ui/screen/save_screen.dart';
import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/view_model/booked_view_model.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:badmintop/view_model/news_view_model.dart';
import 'package:badmintop/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    GorViewModel gorViewModel = context.watch<GorViewModel>();
    NewsViewModel newsViewModel = context.watch<NewsViewModel>();
    UserViewModel userViewModel = UserViewModel();
    BookedViewModel bookedViewModel = BookedViewModel();

    List<Widget> _widgetOptions = <Widget>[
      HomeScreen(gorViewModel: gorViewModel, newsViewModel: newsViewModel, userViewModel: userViewModel, bookedViewModel: bookedViewModel,),
      ExploreScreen(gorViewModel: gorViewModel,),
      SaveScreen(gorViewModel: gorViewModel,),
    ];

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      gorViewModel.setGorSearched("");
    });
  }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: blueColorFirst,
    ));
    
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: blueColorThird,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Simpan',
            ),
          ],
        ),
      ),
    );
  }
}