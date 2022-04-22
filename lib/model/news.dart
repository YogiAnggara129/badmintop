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
}
