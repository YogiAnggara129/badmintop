import 'dart:convert';

import 'package:flutter/services.dart';

const gorJsonPath = "assets/json/gor.json";

// List<GorModel> gorModelFromJson(String str) => List<GorModel>.from(json.decode(await rootBundle.loadString(gorJsonPath)).map((x) => GorModel.fromJson(x)));
String response = "";
Future<void> readJson() async {
    response = await rootBundle.loadString(gorJsonPath);
}
List<GorModel> gorModelFromJson(String str) => List<GorModel>.from(json.decode(response).map((x) => GorModel.fromJson(x)));

String gorModelToJson(List<GorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GorModel {
    GorModel({
        required this.name,
        required this.rating,
        required this.address,
        required this.open,
        required this.call,
        required this.images,
        required this.isSave,
    });

    String name;
    double rating;
    String address;
    List<Open> open;
    String call;
    List<String> images;
    bool isSave;

    factory GorModel.fromJson(Map<String, dynamic> json) => GorModel(
        name: json["name"],
        rating: json["rating"].toDouble(),
        address: json["address"],
        open: List<Open>.from(json["open"].map((x) => openValues.map[x])),
        call: json["call"],
        images: List<String>.from(json["images"].map((x) => x)),
        isSave: json["is_save"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "address": address,
        "open": List<dynamic>.from(open.map((x) => openValues.reverse?[x])),
        "call": call,
        "images": List<dynamic>.from(images.map((x) => x)),
        "is_save": isSave,
    };
}

enum Open { RABU_09002300, KAMIS_09002300, JUMAT_09002300, SABTU_09002300, MINGGU_09002300, SENIN_09002300 }

final openValues = EnumValues({
    "Jumat,09.00–23.00": Open.JUMAT_09002300,
    "Kamis,09.00–23.00": Open.KAMIS_09002300,
    "Minggu,09.00–23.00": Open.MINGGU_09002300,
    "Rabu,09.00–23.00": Open.RABU_09002300,
    "Sabtu,09.00–23.00": Open.SABTU_09002300,
    "Senin,09.00–23.00": Open.SENIN_09002300
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}


// Future<void> readJson() async {
//     final String response = await rootBundle.loadString(gorJsonPath);
    
//     // ... 
// }