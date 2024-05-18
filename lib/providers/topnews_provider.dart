import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hacker_news/models/latestnews_model.dart';
import 'package:hacker_news/models/topnews_model.dart';
import 'package:http/http.dart' as http;

class NewsProvider with ChangeNotifier {
  List<TopNews> _topnews = [];
  List<TopNews> get topNews => _topnews;

  List<LatestNews> _latestnews = [];
  List<LatestNews> get latestNews => _latestnews;

  Future<void> fetchTopNews() async {
    final response = await http.get(Uri.parse(
        'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty'));
    if (response.statusCode == 200) {
      List<dynamic> ids = json.decode(response.body);
      List<TopNews> loadedStories = [];

      for (var id in ids.take(10)) {
        final storyResponse = await http.get(Uri.parse(
            'https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty'));
        if (storyResponse.statusCode == 200) {
          loadedStories.add(TopNews.fromJson(json.decode(storyResponse.body)));
        }
      }
      print(loadedStories.length.toInt());
      _topnews = loadedStories;
      notifyListeners();
    } else {
      throw Exception('Failed to load top news');
    }
  }

  Future<void> fetchLatestNews() async {
    final response = await http.get(Uri.parse(
        'https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty'));
    if (response.statusCode == 200) {
      List<dynamic> ids = json.decode(response.body);
      List<LatestNews> loadedNews = [];

      for (var id in ids.take(10)) {
        final storyResponse = await http.get(Uri.parse(
            'https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty'));
        if (storyResponse.statusCode == 200) {
          loadedNews.add(LatestNews.fromJson(json.decode(storyResponse.body)));
        }
      }
      print(loadedNews.length.toInt());
      _latestnews = loadedNews;
      notifyListeners();
    } else {
      throw Exception('Failed to load latest news');
    }
  }
}
