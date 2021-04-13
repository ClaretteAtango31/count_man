import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageData extends StatefulWidget{
  @override
  _PageData createState() => new _PageData();
}
class _PageData extends State<PageData>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:const Color(0xff467F97) ,
          actions: [
            Container(
              child: IconButton(
                icon: Container(
                  child: Icon(
                    CupertinoIcons.checkmark_alt,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff76909B),
                  ),

                  child: Image.asset("assets/counter.png",
                    height: 65.0,
                    width: 80.0,
                  ),
                  padding: EdgeInsets.all(120),
                ),
                padding(),
                Container(
                child: Column(
                  children: <Widget>[
                    Text
                    padding(),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Mot de passe",
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                )
              ],
            )
        )
    );

  }
  Padding padding() {
    return new Padding(
      padding: EdgeInsets.only(top: 22.0),
    );
  }
}