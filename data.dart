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
        decoration: BoxDecoration(
          color: const Color(0xff76909B),

        ),
        child: Center(
          child:Container(
            child: Column(
          children: <Widget>[
            Text("Nom de l'entreprise"),
            TextField(),
          ],
          )
          )
        )
      ),
    );

  }
}