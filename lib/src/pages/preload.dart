import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = true;

  void requestInfo() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      loading = true;
    });

    bool req = await Provider.of<AppData>(context).requestData();

    if (req) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  void initState() {
    super.initState();

    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/devstravel_logo.png',
              width: 200,
            ),
            loading
                ? Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'Carregando informações...',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : Container(),
            loading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  )
                : Container(),
            !loading
                ? Container(
                    margin: EdgeInsets.all(16),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('Tentar novamente'),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
