import 'package:badmintop/helper/currency_format.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/model/gor.dart';
import 'package:badmintop/ui/screen/detail_screen.dart';
import 'package:provider/provider.dart';

class GorListWidget extends StatelessWidget {
  const GorListWidget({Key? key, required this.gor}) : super(key: key);

  final List<Gor> gor;

  @override
  Widget build(BuildContext context) {
    GorViewModel gorViewModel = context.watch<GorViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: gor.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              gorViewModel.setGorIdSelected(gor[index].id);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailScreen()),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gor[index].name!,
                      style:h2ItemStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          gor[index].rating.toString(),
                          style: itemContentStyle,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          CurrencyFormat.convertToIdr(gor[index].hourlyPrice, 2),
                          style: itemContentStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      gor[index].address!,
                      style: itemContentStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class GorImagesListWidget extends StatelessWidget {
  const GorImagesListWidget({ Key? key, required this.gorImages }) : super(key: key);

  final List<String> gorImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Foto",
            style: h1ItemStyle,
          ),
          SizedBox(
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: gorImages.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      gorImages[index],
                      fit: BoxFit.fill,
                      width: 200.0,
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}