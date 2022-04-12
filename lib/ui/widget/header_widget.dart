import 'package:flutter/material.dart';
import 'package:badmintop/ui/theme/theme.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.contents}) : super(key: key);

  final Widget contents;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          contents,
        ],
      ),
    );
  }
}