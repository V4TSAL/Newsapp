import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_news/model/article_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Article>> getArticle() async {
    final endPointUrl =
        "https://newsapi.org/v2/everything?q=apple&from=2023-03-07&to=2023-03-07&sortBy=popularity&apiKey=bb6e17627bc541f38546511402708c2d";
    http.Response res = await http.get(Uri.parse(endPointUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
