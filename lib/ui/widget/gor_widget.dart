import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/model/gor_repository.dart';
import 'package:badmintop/model/gor.dart';
import 'package:badmintop/ui/screen/detail_screen.dart';
import 'package:provider/provider.dart';

class GorWidget extends StatelessWidget {
  const GorWidget({Key? key, required this.gorList}) : super(key: key);
  
  final List<Gor> gorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: GorListWidget(gor: gorList),
    );
  }
}

class GorListWidget extends StatelessWidget {
  const GorListWidget({Key? key, required this.gor}) : super(key: key);

  final List<Gor> gor;

  @override
  Widget build(BuildContext context) {
    GorViewModel gorViewModel = context.watch<GorViewModel>();
    return ListView.builder(
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
              MaterialPageRoute(builder: (context) => DetailScreen()),
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
                      )
                    ],
                  ),
                  SizedBox(
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
    );
  }
}