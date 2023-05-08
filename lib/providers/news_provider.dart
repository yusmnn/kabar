import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/news_model.dart';

import '../services/news_api.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newsList = [];

  List<NewsModel> get getNewsList {
    return newsList;
  }

  Future<List<NewsModel>> fetchAllNews() async {
    newsList = await NewsApiServices.getAllNews();

    return newsList;
  }

  Future<List<NewsModel>> fetchTopHeadlines() async {
    newsList = await NewsApiServices.getTopHeadlines();

    return newsList;
  }

  Future<List<NewsModel>> searchNewsProvider({required String query}) async {
    newsList = await NewsApiServices.searchNews(query: query);
    return newsList;
  }

  Future<List<NewsModel>> sourceDomainProvider({required String domain}) async {
    newsList = await NewsApiServices.domainNews(domain: domain);
    return newsList;
  }
}
