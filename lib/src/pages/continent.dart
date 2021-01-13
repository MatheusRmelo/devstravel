import 'package:devstravel/src/partials/citybox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ContinentPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Helvitica Neue');

  void seeCityAction(context, int continentIndex) {
    Navigator.pushNamed(context, '/listcity', arguments: continentIndex);
  }

  void cityBoxAction(pageContext, cityData) {
    Navigator.pushNamed(pageContext, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldkey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldkey,
            pageContext: context,
            title: 'Escolha um continente'),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: ListView.builder(
            itemCount: appdata.data.length,
            itemBuilder: (context, index) {
              var cities = [];
              for (var country in appdata.data[index]['countries']) {
                cities.addAll(country['cities']);
              }

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text(
                          "${appdata.data[index]['name']} (${cities.length})",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvetica Neue'),
                        ),
                      ),
                      FlatButton(
                          onPressed: () {
                            seeCityAction(context, index);
                          },
                          child: Text(
                            "Ver cidades",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica Neue',
                                color: Colors.grey),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    height: 140,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cities.length,
                        itemBuilder: (cityContext, cityIndex) {
                          return CityBox(
                              data: cities[cityIndex],
                              onTap: (cityData) {
                                cityBoxAction(context, cityData);
                              });
                        }),
                  )
                ],
              );
            }),
      ),
    );
  }
}
