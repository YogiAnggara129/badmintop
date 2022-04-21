import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveButtonWidget extends StatefulWidget {
  const SaveButtonWidget({ Key? key }) : super(key: key);


  @override
  _SaveButtonWidgetState createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget> {
  
  @override
  Widget build(BuildContext context) {
    GorViewModel gorViewModel = context.watch<GorViewModel>();
    return InkWell(
      onTap: (() => setState(() => gorViewModel.pressedSaveGor())),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          border: gorViewModel.gorSelected.isSave! ? null : Border.all(
            color: blueColorFirst,
            width: 1.5
          ),
          color: gorViewModel.gorSelected.isSave! ? blueColorFirst : null,
          borderRadius: const BorderRadius.all(
            Radius.circular(20)
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.bookmark_add_outlined,
              color: gorViewModel.gorSelected.isSave! ? Colors.white : blueColorFirst,
            ),
            Text(
              gorViewModel.gorSelected.isSave! ? "Disimpan" : "Simpan",
              style: gorViewModel.gorSelected.isSave! ? h3HeaderStyle : itemContentStyle,
            )
          ],
        ),
      ),
    );
  }
}