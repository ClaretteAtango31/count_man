import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPage createState() => new _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF63A4BF),
        child: new Center(
          child: new Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(top: 00.0, right: 80.0, left: 80.0, bottom: 0.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/unnamed.png",
                      height: 65.0,
                      width: 80.0,
                    ),
                    padding: EdgeInsets.all(15.0),

                  ),
                ]),
          ),
        ),
      ),

    );
  }
}
  

