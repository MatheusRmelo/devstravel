import 'package:flutter/material.dart';

Widget CustomAppBar(
    {GlobalKey<ScaffoldState> scaffoldKey,
    BuildContext pageContext,
    String title = '',
    bool hideSearch = false,
    bool showBack = false}) {
  void searchAction() {
    Navigator.pushReplacementNamed(pageContext, '/search');
  }

  IconButton drawerIcon = IconButton(
    icon: Icon(
      Icons.menu,
      color: Colors.black,
      size: 30,
    ),
    onPressed: () {
      scaffoldKey.currentState.openDrawer();
    },
  );
  IconButton backIcon = IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: Colors.black,
      size: 30,
    ),
    onPressed: () {
      Navigator.pop(pageContext);
    },
  );
  IconButton leadingButton = drawerIcon;
  if (showBack) {
    leadingButton = backIcon;
  }

  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    title: Text(
      title,
      style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvetica Neue'),
    ),
    leading: leadingButton,
    actions: [
      !hideSearch
          ? IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
              onPressed: searchAction,
            )
          : Container()
    ],
  );
}
