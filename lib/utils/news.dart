import 'package:mymoney/screen/home/account/news/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News{


  // Stock apiP97NOWRAYZORLCY8
  List<ArticleModel> news = [];

  Future<void> getNews() async{

    // String url =  "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=e171524ffeec46ed93c1ee2bedd5ec91";
    String url =  "https://newsapi.org/v2/everything?q=tesla&from=2023-02-03&sortBy=publishedAt&apiKey=e171524ffeec46ed93c1ee2bedd5ec91";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            //publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }
  }
}