import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/customdrawer.dart';

class CityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Helvitica Neue');

  void backButtonAction(pageContext) {
    Navigator.pop(pageContext);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cityData = ModalRoute.of(context).settings.arguments;

    //print(cityData['name']);

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double footerHeight = MediaQuery.of(context).padding.bottom;

    var starRate = double.parse(cityData['review']).floor();
    var stars = [];
    for (var i = 0; i < 5; i++) {
      if (i < starRate) {
        stars.add(true);
      } else {
        stars.add(false);
      }
    }
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldkey,
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                height: 250,
                child: Image.network(cityData['places'][0]['img'],
                    fit: BoxFit.cover)),
            ListView(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 220),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    cityData['name'],
                                    style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color:
                                          stars[0] ? Colors.blue : Colors.grey,
                                      size: 16,
                                    ),
                                    Icon(Icons.star,
                                        color: stars[1]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 16),
                                    Icon(Icons.star,
                                        color: stars[2]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 16),
                                    Icon(Icons.star,
                                        color: stars[3]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 16),
                                    Icon(Icons.star,
                                        color: stars[4]
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: 16),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        cityData['review'],
                                        style: TextStyle(
                                            fontFamily: 'Helvetica Neue',
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(16),
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 0, left: 16, right: 16, bottom: 10),
                        child: Text(
                          cityData['description'],
                          style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          'PRINCIPAIS PONTOS TURÍSTICOS',
                          style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GridView.count(
                        padding: EdgeInsets.only(bottom: footerHeight),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(
                            cityData['places'].length * 5,
                            (index) => Container(
                                  height: 100,
                                  width: 100,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(color: Colors.red),
                                )),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: statusBarHeight),
              height: 50,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  backButtonAction(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
