import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'data.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHome createState() => new _PageHome();
}

class _PageHome extends State<PageHome> {
  final List<String> entries = <String>[
    'Entreprise A',
    'Entreprise B',
    'Entreprise C',
    'Entreprise D',
    'Entreprise E',
    'Entreprise F',
    'Entreprise G',
    'Entreprise H',
    'Entreprise I',
    'Entreprise J',
    'Entreprise K',
    'Entreprise L',
    'Entreprise M'
  ];
  final List<String> list= [
    'Deconnexion',
    'Effacer les données',
    'A propos',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            drawer: new Drawer(
              child: new Container(
                child: new ListView.builder(
                    itemCount: list.length + 2,
                  itemBuilder: (context, int i){
                      return Scaffold(
                        drawer:  DrawerHeader(child: null,

                        ),

                      );
                  }
                ),
                color: Colors.blueAccent,
              ),
            ),
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
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            body: ListView.builder(
                itemCount: entries.length+2,
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                itemBuilder: (BuildContext context, int index) {

                  if(index==0) {
                    return Container(
                        height: 55,
                        child: Text(
                          "COUNT - MAN",
                          textAlign: TextAlign.center,

                          style:
                          TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        )
                    );
                  }
                  else if (index == 1){
                    return Container(
                        height: 55,
                        child: Text(
                          "Suivi et contrôle de vos compteurs électriques",
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
                        )
                    );
                  }
                  else {
                    return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 7.5),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 3.0,
                                      color: const Color(0xFF66C2E8),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0) //
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 4,
                                          offset: Offset(1, 4))
                                    ]),
                                child: ListTile(
                                  title: Text(' ${entries[index - 2]}'),
                                  subtitle: Text(' 112,5 - null '),
                                  trailing: IconButton(
                                    icon: Container(
                                      child: Icon(
                                        CupertinoIcons.add,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 4,
                                                offset: Offset(1, 4))
                                          ]),
                                    ),
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                        return PageData();
                                      }
                                      )
                                        );
                                    },
                                  ),
                                )
                            )
                        )
                    );
                  }
                }
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              elevation: 10,
              backgroundColor: const Color(0xff30708B),
              child: Icon(
                Icons.send,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
