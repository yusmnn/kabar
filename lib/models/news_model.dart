import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/format_date.dart';

class NewsModel with ChangeNotifier {
  NewsModel({
    required this.newsId,
    required this.sourceName,
    required this.authorName,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.dateToShow,
    required this.content,
    required this.readingTimeText,
  });

// parse json data from API to NewsModel
  factory NewsModel.fromJson(dynamic json) {
    final String dateToShow = formatDate(json["publishedAt"]);

    return NewsModel(
      newsId: json['source']['id'] ?? '',
      sourceName: json["source"]["name"] ?? "",
      authorName: json['author'] ?? '',
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json['url'] ?? '',
      urlToImage:
          json["urlToImage"] ?? "https://i.postimg.cc/qqR4NbHK/error-image.png",
      publishedAt: json['publishedAt'] ?? '',
      content: json["content"] ?? "",
      dateToShow: dateToShow,
      readingTimeText: json['readingTimeText'] ?? '',
    );
  }

  final String newsId,
      sourceName,
      authorName,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      dateToShow,
      content,
      readingTimeText;

  static List<NewsModel> newsFromSnapshot(List snapshot) {
    return snapshot.map((json) {
      return NewsModel.fromJson(json);
    }).toList();
  }
}
