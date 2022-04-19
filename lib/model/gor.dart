class Gor {
  String? name;
  double? rating;
  String? address;
  List<String>? open;
  String? call;
  List<String>? images;
  bool? isSave;

  Gor(
      {this.name,
      this.rating,
      this.address,
      this.open,
      this.call,
      this.images,
      this.isSave});

  Gor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rating = json['rating'];
    address = json['address'];
    open = json['open'].cast<String>();
    call = json['call'];
    images = json['images'].cast<String>();
    isSave = json['is_save'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['address'] = this.address;
    data['open'] = this.open;
    data['call'] = this.call;
    data['images'] = this.images;
    data['is_save'] = this.isSave;
    return data;
  }
}