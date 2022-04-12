import 'package:badmintop/model/news.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/model/news_repository.dart';
import 'package:badmintop/ui/widget/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("tes");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const HeaderWidget(contents: WelcomeContents()),
        const Booking(),
        NewsWidget(),
      ],
    );
  }
}

class WelcomeContents extends StatelessWidget {
  const WelcomeContents ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  style:h1HeaderStyle,
              ),
            ],
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/iconwaifu.png"),
            radius: 30.0,
          ),
        ]
      ),
    );
  }
}

class Booking extends StatelessWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: lineItemStyle,
            child: Text(
              'Booking Terbaru',
              style: h1ItemStyle,
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No. Booking xxx',
                    style: itemContentStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Barokah Bandminton Cikarang',
                      style: h1ItemStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Sukasari, Kec. Serang Baru, Kabupaten Bekasi, Jawa Barat 17330',
                      style: itemContentStyle,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: const [
                            Icon(Icons.calendar_today),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('4 April 2022'),
                            ),
                          ],
                        )
                      ),
                      Expanded(
                        child: Row(
                          children: const [
                            Icon(Icons.access_time),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('9.00 - 12.00'),
                            ),
                          ],
                        )
                      )
                    ],
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }
}

class NewsWidget extends StatelessWidget {
  NewsWidget({Key? key}) : super(key: key);

  final NewsRepository newsRepository = NewsRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: lineItemStyle,
            child: Text(
              'Berita',
              style: h1ItemStyle,
            ),
          ),
          FutureBuilder<List<News>>(
            future: newsRepository.fetchNewsList(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error has occurred!'),
                );
              } else if (snapshot.hasData) {
                return NewsList(news: snapshot.data!);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      )
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.news}) : super(key: key);

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.network(
                    news[index].img!,
                    width: 70.0,
                    height: 60.0,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          news[index].title!,
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: h1ItemStyle,
                        ),
                      ),
                      Text(
                        news[index].date!,
                        style: itemContentStyle,
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}

// class GorList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         final GorModel gor = gorModelFromJson(gorJsonPath)[index];
//         return InkWell(
//           onTap: () {},
//           child: Card(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expanded(
//                   flex: 1,
//                   child: Image.asset(gor.images[0]),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           gor.name,
//                           style: TextStyle(fontSize: 16.0),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(gor.address),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//       itemCount: gorModelFromJson(gorJsonPath).length,
//     );
//   }

// }