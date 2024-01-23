// ignore_for_file: no_leading_underscores_for_local_identifiers

class Article {
  Article({
    required this.id,
    required this.text,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.url,
    required this.premium,
    required this.order,
    required this.image,
  });
  late final int id;
  late final String text;
  late final String title;
  late final String imageUrl;
  late final String authorName;
  late final String url;
  late final int premium;
  late final int order;
  late final String image;

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    title = json['title'];
    imageUrl = json['image_url'];
    authorName = json['author_name'];
    url = json['url'];
    premium = json['premium'];
    order = json['order'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['text'] = text;
    _data['title'] = title;
    _data['image_url'] = imageUrl;
    _data['author_name'] = authorName;
    _data['url'] = url;
    _data['premium'] = premium;
    _data['order'] = order;
    _data['image'] = image;
    return _data;
  }
}
