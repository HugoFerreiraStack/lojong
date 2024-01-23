// ignore_for_file: no_leading_underscores_for_local_identifiers

class Quote {
  Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.order,
  });
  late final int id;
  late final String text;
  late final String author;
  late final int order;

  Quote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    author = json['author'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['text'] = text;
    _data['author'] = author;
    _data['order'] = order;
    return _data;
  }
}
