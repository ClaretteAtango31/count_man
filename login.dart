import 'package:count_man_app/widgets/beforehome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;



  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  final FocusNode emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,

      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login.png"),fit: BoxFit.cover,
          ),
        ),
        child: new Center(

          //children:<Widget>[
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
                padding(),

                new TextField(
                  textInputAction: TextInputAction.next,
                  onSubmitted: (term){
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white,
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                    ),
                    enabledBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                ),
                new TextField(
                  textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                    print("Terminé");
                    },
                  focusNode: _passwordFocus,
                  decoration: InputDecoration(
                    labelText: "Mot de passe",
                    labelStyle:
                    TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic
                    ),
                    enabledBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                ),
                ),
                padding(),
                new RaisedButton(
                  elevation: 0,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                  child: new Text("Connexion",
                  style: new TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  ),
                  ),
                  onPressed:(){
                    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)
                    {
                      return new PageBeforeHome();
                    }
                    )
                    );
                  },
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding padding(){
    return new Padding (padding: EdgeInsets.only(top: 70.0),
    );
  }
}