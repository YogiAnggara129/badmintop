import 'package:flutter/material.dart';
import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/model/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key, required this.newsList}) : super(key: key);

  final List<News> newsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              'Berita',
              style: h1ItemStyle,
            ),
          ),
          NewsListWidget(news: newsList),
        ],
      )
    );
  }
}

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({Key? key, required this.news}) : super(key: key);

  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap:() async {
            if (await canLaunch(news[index].url!)) {
              await launch(news[index].url!);
            } else {
              throw "Could not launch ${news[index].url}!";
            }
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    news[index].img!,
                    width: 70.0,
                    height: 60.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news[index].title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: h2ItemStyle,
                        ),
                        const SizedBox(
                          height: 5,
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
          ),
        );
      },
    );
  }
}