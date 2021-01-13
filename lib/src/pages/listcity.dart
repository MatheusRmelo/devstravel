import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ListCityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Helvitica Neue');

  void cityBoxAction(pageContext, cityData) {
    Navigator.pushNamed(pageContext, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    final int contentIndex = ModalRoute.of(context).settings.arguments;

    return Consumer<AppData>(builder: (ctx, appdata, child) {
      var cities = [];

      for (var country in appdata.data[contentIndex]['countries']) {
        cities.addAll(country['cities']);
      }

      return Scaffold(
        key: _scaffoldkey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldkey,
            pageContext: context,
            title:
                "${appdata.data[contentIndex]['name']} (${cities.length} cidades)",
            showBack: true),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(
              cities.length,
              (index) => CityBox(
                    data: cities[index],
                    onTap: (cityData) {
                      cityBoxAction(context, cityData);
                    },
                  )),
        ),
      );
    });
  }
}
