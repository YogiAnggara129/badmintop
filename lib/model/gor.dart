class Gor {
  int? id;
  String? name;
  double? rating;
  String? address;
  List<String>? open;
  String? call;
  List<String>? images;
  bool? isSave;
  double? hourlyPrice;

  Gor(
      {this.id,
      this.name,
      this.rating,
      this.address,
      this.open,
      this.call,
      this.images,
      this.isSave,
      this.hourlyPrice});

  Gor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
    address = json['address'];
    open = json['open'].cast<String>();
    call = json['call'];
    images = json['images'].cast<String>();
    isSave = json['is_save'];
    hourlyPrice = json['hourly_price'];
  }
}