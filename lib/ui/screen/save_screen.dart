import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/ui/widget/gor_widget.dart';
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
        const HeaderWidget(),
        const SearchBarWidget(),
        gorViewModel.gorSavedIdList != [] ? GorWidget(gorList: gorViewModel.gorSavedList) : Center(
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
          Image.asset('assets/images/logo.png', height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Simpan',
                  style: h1HeaderStyle,
                ),
                Text(
                  'Jangan disimpan aja, yuk booking gornya!',
                  style: h3HeaderStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}