import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultPage extends StatefulWidget {

  final String details;
  ResultPage({this.details,});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Map horoscopedetails;
  fetchdetails() async {
    http.Response response = await http.get("http://horoscope-api.herokuapp.com/horoscope/today/"+widget.details);
    setState(() {
      horoscopedetails = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchdetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Your Horoscope",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text("Sun Sign : ",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
              new Text(horoscopedetails["sunsign"],style: TextStyle(fontSize: 30,color: Colors.teal[500],fontWeight: FontWeight.bold),),
            ],
          ),
          new Padding(padding: const EdgeInsets.only(top: 10)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text("Date : ",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
              new Text(horoscopedetails["date"],style: TextStyle(fontSize: 30,color: Colors.teal[500],fontWeight: FontWeight.bold),),
            ],
          ),
          new Padding(padding: const EdgeInsets.only(top: 15)),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text("Horoscope For The Day : ",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
              new Text(horoscopedetails["horoscope"],style: TextStyle(fontSize: 30,color: Colors.teal[500],fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),
            ],
          ),
          new Padding(padding: const EdgeInsets.only(top: 20)),
          new RaisedButton(
            padding: const EdgeInsets.all(10),
            child : new Text("Go Back",style: TextStyle(fontSize: 25,color: Colors.teal[500],fontWeight: FontWeight.bold),),
            onPressed: (){
              Navigator.pop(context);
            },
            color: Colors.white,
            shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ],
      ),
    );
  }
}