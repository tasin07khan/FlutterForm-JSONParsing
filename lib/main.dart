import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'list.dart';


void main() => runApp( new MaterialApp(
  home: new LoginPage(),
));

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

var formKey = GlobalKey<FormState>();

var scaffoldKey = GlobalKey<ScaffoldState>();


Future navigateToSubPage(context) async {

  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
}


void _validateForm(BuildContext context)
{
  final form = formKey.currentState;
  if(form.validate())
    {
      navigateToSubPage(context);
    }
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Login Form"),
      ),

      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Form(
          key: formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Email Id'),
                  validator: (val) => !val.contains('@') ? 'Invalid Email Id' : null,
//                  onSaved: (val) => _email = val,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.length < 6? 'Incorrect Password' : null,
                ),
                new Padding(padding: const EdgeInsets.all(20.0)),
                new RaisedButton(
                  child: new Text('Login',
                    style : new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.black
                  ),
                  ),
                  color: Colors.cyanAccent,
                  onPressed: () {
                    _validateForm(context);
                  },
                )
              ],
            )
        ),
      ),
    );
  }
}








/*
void main() => runApp( new MaterialApp(
    home: new HomePage(),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  final String url = "https://swapi.co/api/people";
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{

    var response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept":"application/json"}
    );
    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['results'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("This is HTTP get demo"),
      ),
      body: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index){
            return new Container(
              child: new Center(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Card(
                      child: new Container(
                        child: new Text(data[index]['name']),
                        padding: const EdgeInsets.all(20.0),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
      ),
    );
  }
}
*/