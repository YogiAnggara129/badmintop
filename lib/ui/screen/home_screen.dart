import 'package:badmintop/ui/widget/header_widget.dart';
import 'package:badmintop/view_model/booked_view_model.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:badmintop/view_model/news_view_model.dart';
import 'package:badmintop/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/ui/widget/newestbooking_widget.dart';
import 'package:badmintop/ui/widget/news_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.gorViewModel, required this.newsViewModel, required this.userViewModel, required this.bookedViewModel}) : super(key: key);

  final GorViewModel gorViewModel;
  final NewsViewModel newsViewModel;
  final UserViewModel userViewModel;
  final BookedViewModel bookedViewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HomeHeaderWidget(user: userViewModel.user),
        NewestBookingWidget(gorBooked: gorViewModel.getGorBookedNewest(), booked: bookedViewModel.getBookedNewest()),
        NewsWidget(newsList: newsViewModel.newsList),
      ],
    );
  }
}