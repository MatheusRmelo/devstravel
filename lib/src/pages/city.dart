import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class CityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Helvitica Neue');

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cityData = ModalRoute.of(context).settings.arguments;

    print(cityData['name']);

    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldkey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldkey,
            pageContext: context,
            title: 'Tela cidade'),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: Center(child: Text('...')),
      ),
    );
  }
}
