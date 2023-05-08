import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/format_date.dart';

class NewsModel with ChangeNotifier {
  String newsId,
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
    String dateToShow = formatDate(json["publishedAt"]);

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

  static List<NewsModel> newsFromSnapshot(List snapshot) {
    return snapshot.map((json) {
      return NewsModel.fromJson(json);
    }).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};

  //   data['NewsId'] = newsId;
  //   data['sourceName'] = sourceName;
  //   data['authorName'] = authorName;
  //   data['title'] = title;
  //   data['description'] = description;
  //   data['url'] = url;
  //   data['urlToImage'] = urlToImage;
  //   data['publishedAt'] = publishedAt;
  //   data['dateToShow'] = dateToShow;
  //   data['content'] = content;
  //   data['readingTimeText'] = readingTimeText;

  //   return data;
  // }
}
