import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/ui/widget/gor_widget.dart';
import 'package:badmintop/ui/widget/header_widget.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/ui/widget/searchbar_widget.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({Key? key, required this.gorViewModel}) : super(key: key);

  final GorViewModel gorViewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SaveHeaderWidget(),
        SearchBarWidget(gorViewModel: gorViewModel,),
        gorViewModel.isThereGorSaved ? GorListWidget(gorViewModel: gorViewModel, isSaved: true,) : Center(
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