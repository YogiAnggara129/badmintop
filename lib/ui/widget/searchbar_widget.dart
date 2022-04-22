import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({ Key? key, required this.gorViewModel }) : super(key: key);

  final GorViewModel gorViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        onChanged: (value) => gorViewModel.setGorSearched(value),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Cari gor di sini ....',
        ),
      ),
    );
  }
}