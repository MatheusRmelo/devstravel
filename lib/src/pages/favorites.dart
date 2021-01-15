import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class FavoritesPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Helvitica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      List favorites = appdata.favoritesCities();
      print(favorites);

      return Scaffold(
        key: _scaffoldkey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldkey,
            pageContext: context,
            title: 'Cidades salvas',
            hideSearch: true),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
              favorites.length,
              (index) => CityBox(
                    data: favorites[index],
                    onTap: (cityData) {
                      Navigator.pushNamed(context, '/city',
                          arguments: cityData);
                    },
                  )),
        ),
      );
    });
  }
}
