import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_news/apicall.dart';
import 'package:flutter_application_news/model/article_model.dart';
import 'package:flutter_application_news/listtile.dart';
import 'package:intl/intl.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF464646),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "H E A D L I N E S",
          style: GoogleFonts.robotoSlab(
            fontSize: 29,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF000000),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data!;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
