import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/Model/ArticlesModel.dart';

class api {
  static String APIKEY = "fe5e7487162f42c595a26aadf5978b5e";

  static Future<List<ArticlesModel>> fetchArticles() async {
    List<ArticlesModel> ListModel = [];
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&apiKey=$APIKEY");
    var respons = await http.get(url);
    var responsBody = jsonDecode(respons.body)["articles"];

    for (var i in responsBody) {
      ListModel.add(ArticlesModel(
          title: i["title"],
          description: i["description"],
          url: i["url"],
          urlToImage: i["urlToImage"],
          publishedAt: i["publishedAt"],
          author: i["author"]));
    }
    return ListModel;
  }

  static Future<List<ArticlesModel>> fetchcategoryArticles(String category) async {
    List<ArticlesModel> ListModel = [];
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$APIKEY");
    var respons = await http.get(url);
    var responsBody = jsonDecode(respons.body)["articles"];

    for (var i in responsBody) {
      ListModel.add(ArticlesModel(
          title: i["title"],
          description: i["description"],
          url: i["url"],
          urlToImage: i["urlToImage"],
          publishedAt: i["publishedAt"],
          author: i["author"]));
    }
    return ListModel;
  }
}
