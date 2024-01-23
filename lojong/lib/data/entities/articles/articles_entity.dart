// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:lojong/data/entities/articles/article_entity.dart';

class Articles {
  Articles({
    required this.hasMore,
    required this.currentPage,
    required this.lastPage,
    required this.nextPage,
    required this.content,
  });
  late final bool hasMore;
  late final int currentPage;
  late final int lastPage;
  late final int nextPage;
  late final List<Article> content;

  Articles.fromJson(Map<String, dynamic> json) {
    hasMore = json['has_more'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    nextPage = json['next_page'];
    content = List.from(json['list']).map((e) => Article.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['has_more'] = hasMore;
    _data['current_page'] = currentPage;
    _data['last_page'] = lastPage;
    _data['next_page'] = nextPage;
    _data['list'] = content.map((e) => e.toJson()).toList();
    return _data;
  }
}
