import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/ui/widget/gor_widget.dart';
import 'package:badmintop/ui/widget/header_widget.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/ui/widget/searchbar_widget.dart';
import 'package:provider/provider.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GorViewModel gorViewModel = context.watch<GorViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SaveHeaderWidget(),
        const SearchBarWidget(),
        gorViewModel.isThereGorSaved ? GorListWidget(gor: gorViewModel.gorSavedList) : Center(
          heightFactor: 25,
          child: Text(
            "Belum ada gor yang kamu simpan",
            style: itemContentStyle,
          ),
        )
      ],
    );
  }
}