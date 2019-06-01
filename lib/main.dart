import 'package:flutter/material.dart';
import 'dart:async';
//pages
import 'pages/listpage.dart';
import 'pages/biopage.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: "Arba'in Nawawi",
      color: Colors.blue[700],
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:120.0,bottom:80),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('icon/splash.png')
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                width: 100,
                height: 100,
                ),
              ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 220,
                    child: RaisedButton(
                      elevation: 0,
                      color: Colors.white,
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ListPage()
                      ));
                      },
                      child: Text('Baca Hadits',style: TextStyle(color: Colors.blue),),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Container(
                    width: 220,
                    child: RaisedButton(
                      elevation: 0,
                      color: Colors.white,
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ImamNawawi()
                      ));
                      },
                      child: Text('Tentang',style: TextStyle(color: Colors.blue),),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:100.0),
              child: Text("Arba'in Nawawi Karya\nImam An-Nawawi",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white),
                textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}