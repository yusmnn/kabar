import 'dart:convert';

import 'package:flutter_news_app/consts/api_const.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NewsApiServices {
  static Future<List<NewsModel>> getAllNews() async {
    // https://newsapi.org/v2/everything?q=bitcoin&apiKey=f2c2759099784bfd9b931578f2f12df8

    try {
      final Uri uri = Uri.https(baseUrl, 'v2/everything', {
        'q': 'us',
        'language': 'en',
        'pageSize': '10',
      });
      final Response response = await http.get(
        uri,
        headers: {'X-Api-Key': apiKey},
      );

      Map<dynamic, dynamic> data = jsonDecode(response.body);

      List newsTempList = [];

      // mengolah data artikel dari API.  dataTemp = list dari articles
      for (Map<dynamic, dynamic> dataTemp in data['articles']) {
        newsTempList.add(dataTemp);
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<NewsModel>> getTopHeadlines() async {
    // https://newsapi.org/v2/top-headlines?country=us&apiKey=f2c2759099784bfd9b931578f2f12df8

    try {
      final Uri uri = Uri.https(baseUrl, 'v2/top-headlines', {
        'country': 'us',
        'language': 'en',
      });
      final Response response = await http.get(
        uri,
        headers: {'X-Api-Key': apiKey},
      );

      Map<dynamic, dynamic> data = jsonDecode(response.body);

      List newsTempList = [];

      for (Map<dynamic, dynamic> dataTemp in data['articles']) {
        newsTempList.add(dataTemp);
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<NewsModel>> searchNews({required String query}) async {
    // https://newsapi.org/v2/everything?q=Apple&from=2023-05-03&sortBy=popularity&apiKey=API_KEY

    try {
      final Uri uri = Uri.https(baseUrl, 'v2/everything', {
        'q': query,
        'language': 'en',
        'pageSize': '10',
      });
      final Response response = await http.get(
        uri,
        headers: {'X-Api-Key': apiKey},
      );

      Map<dynamic, dynamic> data = jsonDecode(response.body);
      List newsTempList = [];

      for (Map<dynamic, dynamic> dataTemp in data['articles']) {
        newsTempList.add(dataTemp);
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<NewsModel>> domainNews({required String domain}) async {
    // https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=f2c2759099784bfd9b931578f2f12df8

    try {
      final Uri uri = Uri.https(baseUrl, 'v2/everything', {
        'domains': domain,
        'language': 'en',
        'pageSize': '10',
      });
      final Response response = await http.get(
        uri,
        headers: {'X-Api-Key': apiKey},
      );

      Map<dynamic, dynamic> data = jsonDecode(response.body);
      List newsTempList = [];

      for (Map<dynamic, dynamic> dataTemp in data['articles']) {
        newsTempList.add(dataTemp);
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (e) {
      rethrow;
    }
  }
}
