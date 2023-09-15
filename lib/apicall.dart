import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_news/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
String oldAPIkey="bb6e17627bc541f38546511402708c2d";
String newAPIkey="314d05b89e3c4113b543ac50ae27976b";
class ApiService {
  Future<List<Article>> getArticle() async {
    DateTime now = DateTime.now().subtract(Duration(days:1));
    var formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final endPointUrl =
        "https://newsapi.org/v2/everything?q=apple&from=${formattedDate}&to=${formattedDate}&sortBy=popularity&apiKey=${oldAPIkey}";
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
