import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculator App - Laura Mills Nelson',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static TextEditingController value1 = TextEditingController();
  static TextEditingController value2 = TextEditingController();

  // static TextEditingController ans = TextEditingController();

  static double lbsPerOz = 0.0;
  static double cupsPerOz = 0.0;
  static double ans = 0.0;


  _MyHomePageState() {
    value1.text = "0";
    value2.text = "0";
  }

  void dispose() {
    value1.dispose();
    value2.dispose();
  }

  void _preserves() {
    setState(() {
      lbsPerOz = double.tryParse(value1.text) / 0.125;
      cupsPerOz = double.tryParse(value2.text) / 0.045;

      if ((lbsPerOz / 8) < (cupsPerOz / 8)) {
        ans = lbsPerOz / 8;
      } else {
        ans = cupsPerOz / 8;
      }
    });
  }

//put the picture here
  Widget peachPic = Padding(
      padding: EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
      child: Image.asset(
        "images/peaches.jpg",
        height: 125,
        width: 400,
        fit: BoxFit.cover,
      ));

  Widget header = Container(
    padding: EdgeInsets.all(10.0),
    child: Text(
      "Peach Preserves",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 36.0,
          color: Colors.black,
          fontFamily: "Arial",
          fontWeight: FontWeight.bold),
    ),
  );

  Widget intro = Container(
    padding: EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0, bottom: 10.0),
    child: Text(
        "How many 8 oz. jelly jars of peach preserves can you make with "
        "the ingredients you have? Enter your ingredients in the units "
        "below:",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20.0, color: Colors.black, fontFamily: "Arial")),
  );

  Widget peaches = Container(
    padding: EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          "Peaches  ",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: "Arial"),
        ),
        Container(
            width: 200.0,
            height: 60.0,
            padding: EdgeInsets.all(5.0),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Pounds of Peaches"),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              controller: value1,
              keyboardType: TextInputType.number,
            )),
      ],
    ),
  );

  Widget sugar = Container(
    padding: EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          "Sugar  ",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: "Arial"),
        ),
        Container(
            width: 200.0,
            height: 60.0,
            padding: EdgeInsets.all(5.0),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Cups of Sugar"),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              controller: value2,
              keyboardType: TextInputType.number,
            )),
      ],
    ),
  );

  //Calculate button
  Widget calcButton() {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50.0,
              width: 150.0,
              child: RaisedButton(
                color: Colors.orange,
                textColor: Colors.black,
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: _preserves,
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Calculator App - Laura Mills Nelson")),
        body: Container(
          child: ListView(
            children: <Widget>[
              peachPic,
              header,
              intro,
              peaches,
              sugar,
              calcButton(),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(ans.toStringAsFixed(0) + " jelly jars",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Arial')),
              ),
              Text(
                "This recipe uses 1 cup of sugar for every  ",
                textAlign: TextAlign.center,
              ),
              Text("2.75 pounds of peaches. See the recipe at:",
                textAlign: TextAlign.center,),
              Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: Text(
                  "https://natashaskitchen.com/"
                  "country-peach-preserves/",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            ],
          ),
        )
    );

  }
}
