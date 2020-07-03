import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'resultpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController t1 = new TextEditingController(text: "");

  void clear(){
    t1.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Horoscope App",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Horoscope App",style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                accountEmail: new Text("horoscopeapphelp@gmail.com",style: new TextStyle(fontSize: 15,color: Colors.white),),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.teal[500],
                  child: new Text("HA",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
            ),
            new ListTile(
              title: new Text("Today's Horoscope",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              trailing: new Icon(Icons.wb_sunny,size: 20,color: Colors.white,),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
              },
            ),
            new Padding(padding: EdgeInsets.only(top: 10)),
            new Divider(
              height: 10,
              thickness: 2,
              color: Colors.grey[700],
            ),
            new Padding(padding: EdgeInsets.only(top: 10)),
            new ListTile(
              title: new Text("Close",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              trailing: new Icon(Icons.close,size: 20,color: Colors.white,),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Image.asset("assests/horoscope.jpg",height:250,width: 400,fit: BoxFit.cover,),
            new Padding(padding: const EdgeInsets.only(top: 8)),
            new Container(
              padding: const EdgeInsets.all(15),
              child: new TextField(
                decoration: new InputDecoration(
                  icon: new Icon(Icons.wb_sunny,color: Colors.teal[500],),
                  labelText: "Enter Your Sun Sign:",
                  labelStyle: new TextStyle(fontSize: 25,color: Colors.teal[500],fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.text,
                controller: t1,
              ),
            ),
            new Padding(padding: const EdgeInsets.only(top: 5)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  child : new Text("Submit",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ResultPage(details: t1.text,)));
                    },
                  color: Colors.teal[500],
                  shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                new RaisedButton(
                  child : new Text("Clear",style: TextStyle(fontSize: 20,color: Colors.teal[500],fontWeight: FontWeight.bold),),
                  onPressed: clear,
                  color: Colors.white,
                  shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



