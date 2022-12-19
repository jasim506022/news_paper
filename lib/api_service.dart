import 'dart:convert';

import 'package:http/http.dart';

import 'model/article_model.dart';

class ApiService {
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1549f7110b844fae9d5cf4240e3f4be6";

  //Now let's create the http request function
  // but first let's import the http package

  Future<List<Article>> getArticle() async {
    final uri = Uri.parse(endPointUrl);
    Response res = await get(uri);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      ///print("Response ${articles}"); try to again
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
