import 'package:badmintop/ui/widget/header_widget.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/ui/widget/gor_widget.dart';
import 'package:badmintop/ui/widget/searchbar_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key, required this.gorViewModel}) : super(key: key);

  final GorViewModel gorViewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ExploreHeaderWidget(),
        SearchBarWidget(gorViewModel: gorViewModel),
        GorListWidget(gorViewModel: gorViewModel,)
      ],
    );
  }
}
