import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import './calcButton.dart';

void main() {
  runApp(MyCalc());
}

class MyCalc extends StatefulWidget {
  MyCalc({Key? key}) : super(key: key);

  @override
  MyCalcState createState() => MyCalcState();
}

class MyCalcState extends State<MyCalc> {
  // This widget is the root of your application.
  String _history = '';
  String _expression = '';
  void numberClick(String text) {
    setState(() {
      if (text.isNotEmpty && text.substring(0, 1) == "0") {
        _expression = '';
      } else {
        _expression += text;
      }
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color(0XFF283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: TextStyle(fontSize: 24, color: Color(0xFF455A64)),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
              alignment: Alignment(1, 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton(
                  text: 'AC',
                  fillColor: 0XFFC6807F,
                  textColor: 0XFF000000,
                  fontSize: 20,
                  callback: allClear,
                ),
                calcButton(
                  text: 'C',
                  fillColor: 0XFFC6807F,
                  textColor: 0XFF000000,
                  fontSize: 20,
                  callback: clear,
                ),
                calcButton(
                  text: '%',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF000000,
                  fontSize: 20,
                  callback: numberClick,
                ),
                calcButton(
                  text: '/',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF000000,
                  fontSize: 20,
                  callback: numberClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton(
                  text: '7',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '8',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '9',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '*',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF000000,
                  fontSize: 20,
                  callback: numberClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton(
                  text: '4',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '5',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '6',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '-',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF000000,
                  fontSize: 20,
                  callback: numberClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton(
                  text: '1',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '2',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '3',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '+',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF000000,
                  fontSize: 20,
                  callback: numberClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcButton(
                  text: '.',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '0',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '00',
                  textColor: 0XFF000000,
                  fontSize: 25,
                  callback: numberClick,
                ),
                calcButton(
                  text: '=',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF000000,
                  fontSize: 20,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
