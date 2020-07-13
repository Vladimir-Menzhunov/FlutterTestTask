import 'package:flutter/material.dart';

import 'colors.dart';
import 'home.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mSurfaceWhite,
        brightness: Brightness.dark,
        leading: IconButton(
          color: mBlack,
          iconSize: 30,
          icon: Icon(Icons.loop),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(children: <Widget>[
              SizedBox(height: 200),
              Image.asset(
                "assets/Figure.png",
                fit: BoxFit.fill,
              ),
              SizedBox(height: 16),
              Text(
                "Не удалось загрузить информацию",
                style: TextStyle(
                  color: mBlack,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 40.0,
                width: 200.0,
                decoration: BoxDecoration(
                    color: mPink100, borderRadius: BorderRadius.circular(25)),
                child: MaterialButton(
                  color: mPink100,
                  child: Text("Обновить"),
                  shape: StadiumBorder(),
                  elevation: 8.0,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
