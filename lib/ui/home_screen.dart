import 'package:badmintop/model/gor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:badmintop/ui/theme.dart';
import 'package:badmintop/model/gor_model.dart';

class HomeScreen extends StatelessWidget {
  readJson();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(),
          Booking(),
          News(),
          GorList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: blueColorFirst,
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
      )
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Svg('images/head_shape.svg'),
        )
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('images/logo.png', height: 20.0,),
                  Icon(Icons.supervised_user_circle),
                ]
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Text(
                'Selamat Datang,',
                style: h2HeaderStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0, left: 20.0, right: 20.0),
              child: Text(
                'Budi!',
                style:h1HeaderStyle,
              ),
            ),
          ],
        ),
      )
    );
  }
}

class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 10),
            decoration: lineItemStyle,
            child: Text(
              'Booking Terbaru',
              style: h1ItemStyle,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10.0),
            decoration: cardStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No. Booking xxx',
                  style: itemContentStyle,
                ),
                Text(
                  'Barokah Bandminton Cikarang',
                  style: h1ItemStyle,
                ),
                Text(
                  'Sukasari, Kec. Serang Baru, Kabupaten Bekasi, Jawa Barat 17330',
                  style: itemContentStyle,
                ),
                Row(
                  children: [
                    Expanded(child: Icon(Icons.calendar_month))
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      // width: MediaQuery.of(context).size.width - 20,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 10),
            decoration: lineItemStyle,
            child: Text(
              'Booking Terbaru',
              style: h1ItemStyle,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10.0),
            decoration: cardStyle,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/news1.jpeg',
                  width: 70.0,
                  height: 60.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fakta Menarik Fikri/Bagas, Juara All England Open 2022 yang Kerap Tumbangkan Pemain Unggulan',
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: h1ItemStyle,
                      ),
                      Text(
                        'Senin, 21 Maret 2022 | 09:40 WIB',
                        style: itemContentStyle,
                      ),
                    ],
                  )
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

class GorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final GorModel gor = gorModelFromJson(gorJsonPath)[index];
        return InkWell(
          onTap: () {},
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(gor.images[0]),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          gor.name,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(gor.address),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: gorModelFromJson(gorJsonPath).length,
    );
  }

}