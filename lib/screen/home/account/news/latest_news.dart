import 'package:flutter/material.dart';
import 'package:mymoney/screen/home/account/news/model/article_model.dart';
import 'package:mymoney/screen/home/account/news/model/category_model.dart';
import 'package:mymoney/utils/category_liist.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/news.dart';

class LatestNews extends StatefulWidget {
  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  List<CategorieModel> categoriemodel = new List<CategorieModel>();
  List<ArticleModel> articlemodel = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();
    categoriemodel = getCategories();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    articlemodel = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration( gradient: LinearGradient(
              stops: [0.1, 0.3, 0.7, 0.8],
              colors: [
                kPrimaryColorOrange,
                kPrimaryColororangePink,
                kPrimaryColororangetoPink,
                kPrimaryColorPink,
              ],
              begin: Alignment.topLeft,
            end: Alignment.topRight,
          )),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Latest News",
              style: TextStyle(
                color: white,
              ),
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
        height: 600,
            child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                  child: Column(
                    children: [
                      ////Categories
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                          height: 70,
                          child: ListView.builder(
                            itemCount: categoriemodel.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imageUrl: categoriemodel[index].imageAssetUrl,
                                categoryName: categoriemodel[index].categorieName,
                              );
                            },
                          )),

                      SizedBox(
                        height: 20,
                      ),

                      ////Blogs
                      Container(
                        height: 1000,
                        child: ListView.builder(
                          shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                          itemCount: articlemodel.length,
                            itemBuilder: (context,index){
                            return BlogTile(imageUrl: articlemodel[index].urlToImage,
                                title: articlemodel[index].title,
                                desc: articlemodel[index].description);
                            }),
                      )

                    ],
                  ),
                ),
            ),
          ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imageUrl,
                  width: 120,
                  height: 80,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;

  BlogTile(
      {@required this.imageUrl, @required this.title, @required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imageUrl,
            height: 180,
            fit: BoxFit.cover,),
          ),
          SizedBox(height: 5,),
          Text(title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 5,),
          Text(desc,
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
      color: Colors.blueGrey
    ),),
        ],
      ),
    );
  }
}
