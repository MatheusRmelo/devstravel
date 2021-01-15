import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  List list = [];

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  void doSearch(pageContext, text) async {
    List newList = await Provider.of<AppData>(pageContext).searchCity(text);

    setState(() {
      list = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
          key: _scaffoldkey,
          appBar: CustomAppBar(
              scaffoldKey: _scaffoldkey,
              pageContext: context,
              title: 'Busque uma cidade',
              hideSearch: true),
          drawer: CustomDrawer(pageContext: context),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: TextField(
                  onChanged: (text) {
                    doSearch(context, text);
                  },
                  decoration: InputDecoration(
                      hintText: 'Digite o nome de uma cidade',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 32,
                      )),
                ),
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                    list.length,
                    (index) => CityBox(
                          data: list[index],
                          onTap: (cityData) {
                            Navigator.pushNamed(context, '/city',
                                arguments: cityData);
                          },
                        )),
              ))
            ],
          )),
    );
  }
}
