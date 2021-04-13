import 'package:count_man_app/models/counter.dart';
import 'package:count_man_app/models/user.dart';
import 'package:count_man_app/services/counter_http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:count_man_app/widgets/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PageBeforeHome extends StatefulWidget {

  final User user;

  const PageBeforeHome({Key key, this.user}) : super(key: key);
  @override
  _PageBeforeHome createState() => new _PageBeforeHome();
}

class _PageBeforeHome extends State<PageBeforeHome> {
  @override
  Widget build(BuildContext context) {
    print(widget.user.type);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Bienvenue  ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
              Text(
                "sur Count-Man. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black45,
                ),
              ),
              padding(),
              if(widget.user.type=="ELECTRIC")
                Image.asset("assets/electric.png"),
              if(widget.user.type=="EAU")
                Image.asset("assets/water-drop.png"),
              padding(),

              padding(),
              Text(
                "Cliquez ci-dessous pour charger les données.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
              padding(),
              RaisedButton(
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                onPressed: () {
                  updateCounter();
                },
                color: const Color(0xFF5F9FBA),
                child: Text(
                  "Recharger les données",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  updateCounter()async {
    Alert(context: context, title: "Compteur", desc: "Chargement des compteurs").show();
    CounterList  counters = await CounterHttpService().getAll();
    Navigator.pop(context);
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
          return new PageHome(counters: counters,);
        }));
  }



  Padding padding() {
    return new Padding(
      padding: EdgeInsets.only(top: 22.0),
    );
  }
}
