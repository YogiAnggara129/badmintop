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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['address'] = this.address;
    data['open'] = this.open;
    data['call'] = this.call;
    data['images'] = this.images;
    data['is_save'] = this.isSave;
    data['hourly_price'];
    return data;
  }
}