import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:count_man_app/widgets/home.dart';


class PageBeforeHome extends StatefulWidget {
  @override
  _PageBeforeHome createState() => new _PageBeforeHome();
}

class _PageBeforeHome extends State<PageBeforeHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              width:55,
              margin: EdgeInsets.only(left:5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(1, 4))
                  ]),
              child: IconButton(
                icon: Container(

                  child: Icon(
                    Icons.list,
                    color: Colors.black54,
                    size: 35,
                  ),
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            );
          },
        ),
        actions: <Widget>[
          Container(
            width: 55,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(1, 4))
                ]),
            child: IconButton(
              icon: Container(
                child: Icon(
                  CupertinoIcons.search,
                  color: Colors.black54,
                  size: 35,
                ),
              ),
              color: Colors.white,
              onPressed: () {
                },
            ),
          ),
        ],
      ),
      body: Container(
        padding:  EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [

              Image.asset("assets/water-drop.png"),
              padding(),
              Text(
                "Bienvenue nom d'utilisateur sur Count-Man compteur d'eau.",
                textAlign: TextAlign.center,
              style: TextStyle(color:Colors.black26,),
              ),
              padding(),
              Text(
                "Cliquez ci-dessous pour charger les données.",
                textAlign: TextAlign.center,
                style: TextStyle(color:Colors.black26,),
              ),
              padding(),
              RaisedButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 25),
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                      return new PageHome();
                    }
                    )
                    );
                    },
                  color: const Color(0xFF5F9FBA),
                child: Text("Recharger les données",
                style: TextStyle(color: Colors.white),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
Padding padding(){
  return new Padding (padding: EdgeInsets.only(top: 22.0),
  );
}
}