import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webpage/models/article_model.dart';
import 'package:webpage/widget/helper.dart';

class BuildArticlesGrid extends StatelessWidget {
  final AsyncSnapshot<TopStories> snapshot;

  BuildArticlesGrid({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var stories = snapshot.data.results;

    List<GridTile> tiles = [];
    stories.forEach((story) {
      tiles.add(buildArticleTile(result: story, context: context));
    });

    return Padding(
      padding: responsivePadding(MediaQuery.of(context)),
      child: GridView.count(
        crossAxisCount: responsiveNumberGridTiles(MediaQuery.of(context)),
        mainAxisSpacing: 30,
        crossAxisSpacing: 30,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: tiles,
      ),
    );
  }

  GridTile buildArticleTile({Results result, BuildContext context}) {
    return GridTile(
      child: GestureDetector(
        onTap: () => _launchURL(result.url),
        child: Column(
          children: [
            Container(
              height: responsiveImageHeight(MediaQuery.of(context)),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage(result.multimedia[0].url),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 1),
                        blurRadius: 12)
                  ]),
            ),
            Container(
              alignment: Alignment.center,
              height: responsiveTitleText(MediaQuery.of(context)),
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 1),
                        blurRadius: 12)
                  ]),
              child: Text(
                result.title,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception("SORRY!");
    }
  }
}
