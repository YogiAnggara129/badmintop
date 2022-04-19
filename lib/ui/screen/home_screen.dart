import 'package:badmintop/model/news.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/model/news_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:badmintop/ui/widget/booking_widget.dart';
import 'package:badmintop/ui/widget/news_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const HeaderWidget(),
        const BookingWidget(),
        NewsWidget(),
      ],
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10.0)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            blueColorFirst,
            blueColorSecond,
          ],
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/logo.png', height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        'Selamat Datang,',
                        style: h2HeaderStyle,
                    ),
                    Text(
                        'Budi Susanto!',
                        style: h1HeaderStyle,
                    ),
                  ],
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/iconwaifu.png"),
                  radius: 30.0,
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}