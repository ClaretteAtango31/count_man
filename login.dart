import 'package:count_man_app/services/user_http_service.dart';
import 'package:count_man_app/widgets/beforehome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:count_man_app/models/user.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User id;
  User password;
  final _mdp = TextEditingController();
  final _log = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _mdp.dispose();
    _log.dispose();
    super.dispose();
  }

  final FocusNode emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Container(
            padding: EdgeInsets.only(
                top: 100.0, right: 50.0, left: 50.0, bottom: 0.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/unnamed.png",
                    height: 80.0,
                    width: 80.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
                padding(),
                new TextField(
                  controller: _log,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (term) {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Utilisateur",
                    errorText: _validate ? 'Remplissez le champ' : null,
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                new TextField(
                  controller: _mdp,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) {
                    print("Terminé");
                  },
                  style: TextStyle(color: Colors.white),
                  focusNode: _passwordFocus,
                  decoration: InputDecoration(
                    labelText: "Mot de passe",
                    errorText: _validate ? 'Remplissez le champ' : null,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                padding(),
                new RaisedButton(
                  elevation: 0,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: new Text(
                    "Connexion",
                    style: new TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _mdp.text.isEmpty ? _validate = true : _validate = false;
                      _log.text.isEmpty ? _validate = true : _validate = false;
                    });

                    if (_validate == false) {
                      checkLogin();
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                )
              ],
            ),
          ),
        ),

    );
  }

  checkLogin() async {
    UserHttpService().checkLogin(_log.text, _mdp.text).then((value) {
      if (value != null) {
        _goToHomePage(value.hydraMember[0]);
      }
    });
  }

  _goToHomePage(User user) {
    Navigator.pop(context);
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return new PageBeforeHome(user: user,);
    }));
  }

  Padding padding() {
    return new Padding(
      padding: EdgeInsets.only(top: 40.0),
    );
  }
}
