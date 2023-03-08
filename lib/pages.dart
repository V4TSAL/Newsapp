import 'package:flutter_application_news/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticlePage extends StatelessWidget {
  final Article article;
  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
      ),
      backgroundColor: const Color(0xFF464646),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 275.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 25.0,
                    ),
                  ]),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 88, 87, 87),
                  borderRadius: BorderRadius.circular(13.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 25.0,
                    ),
                  ]),
              child: Text(
                article.source.name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 54, 53, 53),
                  borderRadius: BorderRadius.circular(13.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 25.0,
                    ),
                  ]),
              child: Text(
                article.title,
                style: GoogleFonts.robotoSlab(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFbababa)),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              article.description,
              style: GoogleFonts.robotoSlab(
                  fontSize: 21,
                  // fontWeight: FontWeight.bold,
                  color: Color(0xFFbababa)),
            )
          ],
        ),
      ),
    );
  }
}
