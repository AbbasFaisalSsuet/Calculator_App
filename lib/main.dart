import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var result = '';


  clearr(){
    setState(() {
      result = '';
    });
  }

  output(){
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  Widget customButton(String btnVal){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        // ignore: deprecated_member_use
        child: FlatButton(
          color: Colors.lightBlue[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            setState(() {
              result = result + btnVal;
            });
          },
          child: Text('$btnVal',
          style: GoogleFonts.sarala(
            textStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),
          ),
        ),
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calculator App',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),)),
      ),
      body: SafeArea(
        bottom: true,
        top: true,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsetsDirectional.only(top: 50,bottom: 50),
                  alignment: Alignment.center,
                  child: Text('$result',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                  ),
                ),
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customButton('('),
                  customButton(')'),
                  customButton('^'),
                  customButton('%'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customButton('9'),
                  customButton('8'),
                  customButton('7'),
                  customButton('+'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customButton('6'),
                  customButton('5'),
                  customButton('4'),
                  customButton('-'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customButton('3'),
                  customButton('2'),
                  customButton('1'),
                  customButton('*'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customButton('0'),
                  customButton('.'),
                  customButton('00'),
                  customButton('/'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      color: Colors.lightBlue[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                        onPressed: clearr,
                        child: Text('Clear',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                          ),
                        ),
                      ),
                    customButton(' '),
                    FlatButton(
                      color: Colors.lightBlue[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: output,
                      child: Text('=',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
