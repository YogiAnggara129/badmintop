import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/ui/widget/bookingbuttontab_widget.dart';
import 'package:badmintop/ui/widget/gor_widget.dart';
import 'package:badmintop/ui/widget/gordescription_widget.dart';
import 'package:badmintop/ui/widget/header_widget.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/model/gor.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({ Key? key, required this.gorViewModel }) : super(key: key);

  final GorViewModel gorViewModel;

  @override
  Widget build(BuildContext context) {
    final Gor gor = gorViewModel.gorSelected;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: blueColorFirst,
    ));

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailHeaderWidget(gorViewModel: gorViewModel),
                  GorDescriptionWidget(gor: gor),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GorImagesListWidget(gorImages: gor.images!),
                  const SizedBox(
                    height:100,
                  ),
                ],
              ),
            ),
            BookingButtonTabWidget(gor: gor)
          ]
        ),
      ),
    );
  }
}