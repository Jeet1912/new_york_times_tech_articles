import 'package:flutter/material.dart';
import 'package:webpage/models/article_model.dart';
import 'package:webpage/services/api_service.dart';
import 'package:webpage/widget/buildgrid.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<TopStories> _mainList;
  var section = "Technology";

  @override
  void initState() {
    super.initState();
    _mainList = APIService().getTopStories(section);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: mediaQuery.size.height * 0.04,
          ),
          Center(
            child: Text(
              'The New York Times \n Top Tech Articles',
              textAlign:
                  TextAlign.center, // there's letter spacing in text style
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.01,
          ),
          FutureBuilder(
              future: _mainList,
              builder: (context, snapshot) {
                print(snapshot.connectionState);
                if (snapshot.hasData) {
                  return BuildArticlesGrid(snapshot: snapshot);
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Center(
                        child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator())),
                  );
                }
              }),
        ],
      ),
    );
  }
}
