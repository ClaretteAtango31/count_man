import 'package:count_man_app/models/counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'data.dart';

class PageHome extends StatefulWidget {
  final CounterList counters;

  const PageHome({Key key, this.counters}) : super(key: key);
  @override
  _PageHome createState() => new _PageHome();
}

class _PageHome extends State<PageHome> {

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
            drawer: Drawer(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  DrawerHeader(
                    child: Container(
                      child: Image.asset("assets/unnamed.png",
                        height: 65.0,
                        width: 80.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                       // color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Profil',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    'Déconnexion',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width,
                          color: const Color(0xff30708B),
                          child: Center(
                            child: Text(
                              'Port Autonome de Douala',
                              style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                color: const Color(0xffffffff),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            appBar: new AppBar(
              automaticallyImplyLeading: false,
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
                      onPressed: () => Scaffold.of(context).openDrawer(),
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
                itemCount: widget.counters.hydraMember.length+2,
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
                    Counter counter = widget.counters.hydraMember[index - 2];
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
                                  title: Text(' ${counter.compagnyName}'),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(' ${counter.counterNumber}'),
                                      Text(' ${counter.lastIndex} - ${counter.newIndex} '),
                                    ],
                                  ),
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
