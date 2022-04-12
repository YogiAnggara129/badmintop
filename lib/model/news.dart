class News {
  String? title;
  String? img;
  String? date;
  String? url;

  News({this.title, this.img, this.date, this.url});

  News.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    img = json['img'];
    date = json['date'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['img'] = this.img;
    data['date'] = this.date;
    data['url'] = this.url;
    return data;
  }
}
