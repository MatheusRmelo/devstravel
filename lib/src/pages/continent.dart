import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class ContinentPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Helvitica Neue');

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
            itemBuilder: (context, index) => Text(appdata.data[index]['name'])),
      ),
    );
  }
}
