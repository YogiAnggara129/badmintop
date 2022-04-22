import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';

class SaveButtonWidget extends StatefulWidget {
  const SaveButtonWidget({ Key? key, required this.gorViewModel }) : super(key: key);

  final GorViewModel gorViewModel;

  @override
  _SaveButtonWidgetState createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget> {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => setState(() => widget.gorViewModel.pressedSaveGor())),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          border: widget.gorViewModel.gorSelected.isSave! ? null : Border.all(
            color: blueColorFirst,
            width: 1.5
          ),
          color: widget.gorViewModel.gorSelected.isSave! ? blueColorFirst : null,
          borderRadius: const BorderRadius.all(
            Radius.circular(20)
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.bookmark_add_outlined,
              color: widget.gorViewModel.gorSelected.isSave! ? Colors.white : blueColorFirst,
            ),
            Text(
              widget.gorViewModel.gorSelected.isSave! ? "Disimpan" : "Simpan",
              style: widget.gorViewModel.gorSelected.isSave! ? h3HeaderStyle : itemContentStyle,
            )
          ],
        ),
      ),
    );
  }
}