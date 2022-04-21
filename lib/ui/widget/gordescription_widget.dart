import 'package:badmintop/model/gor.dart';
import 'package:badmintop/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class GorDescriptionWidget extends StatelessWidget {
  const GorDescriptionWidget({ Key? key, required this.gor }) : super(key: key);

  final Gor gor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: const BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide(color: Colors.black12))
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: blueColorThird,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Text(
                  gor.address!,
                  overflow: TextOverflow.clip,
                  style: itemContentStyle,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.call,
                color: blueColorThird,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Text(
                  gor.call!,
                  overflow: TextOverflow.clip,
                  style: itemContentStyle,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            child: ExpansionTile(
              leading: const Icon(Icons.access_time),
              tilePadding: const EdgeInsets.all(0),
              iconColor: Colors.grey,
              collapsedIconColor: blueColorThird,
              childrenPadding: const EdgeInsets.only(left: 20.0),
              title: Text(
                "Waktu Buka",
                style: itemContentStyle,
              ),
              children: gor.open!.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  e,
                  style: itemContentStyle,
                ),
              )).toList()
            ),
          ),
        ],
      ),
    );
  }
}