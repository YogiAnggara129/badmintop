import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/ui/widget/gor_widget.dart';
import 'package:badmintop/ui/widget/searchbar_widget.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GorViewModel gorViewModel = context.watch<GorViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const HeaderWidget(),
        const SearchBarWidget(),
        GorWidget(gorList: gorViewModel.gorList),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/logo.png', height: 20.0,),
              Icon(
                Icons.description_outlined,
                color: Colors.white,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore',
                  style: h1HeaderStyle,
                ),
                Text(
                  'Booking gor badminton terbaik pilihan kami',
                  style: h3HeaderStyle,
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}