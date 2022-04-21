import 'package:badmintop/ui/widget/header_widget.dart';
import 'package:badmintop/view_model/booked_view_model.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:badmintop/view_model/news_view_model.dart';
import 'package:badmintop/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badmintop/ui/widget/newestbooking_widget.dart';
import 'package:badmintop/ui/widget/news_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GorViewModel gorViewModel = context.watch<GorViewModel>();
    NewsViewModel newsViewModel = context.watch<NewsViewModel>();
    UserViewModel userViewModel = UserViewModel();
    BookedViewModel bookedViewModel = BookedViewModel();
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