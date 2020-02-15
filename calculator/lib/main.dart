import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  String output = '0';
  String operand = '';
  String _output = '';
  double num1 = 0.0;
  double num2 = 0.0;

  buttonPressed(String ch) {
    if(ch == 'Clear') {
      operand = '';
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
    }
    else if(ch == '+' || ch == '-' || ch == '*' || ch == '/') {
      num1 = double.parse(_output);
      operand = ch;
      _output = '';
    }
    else if(ch == '.') {
      if(_output.contains('')) {
        print('Already contains decimal point');
        return;
      }
      else {
        _output = _output + ch;
      }
    }
    else if(ch == '=') {
      num2 = double.parse(output);
      if(operand == '+') {
        _output = (num1 + num2).toString();
      }
      if(operand == '-') {
        _output = (num1 - num2).toString();
      }
      if(operand == '/') {
        _output = (num1 / num2).toString();
      }
      if(operand == '*') {
        _output = (num1 * num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    }
    else {
      _output = _output + ch;
    }
    print('output: $output');
    print('_output: $_output');
    setState(() {output = double.parse(_output).toString();});
  }

  Widget buildButton(String ch) {
    return Expanded
    (
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        child: Text(
          ch,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          )
        ),
        onPressed: () {
          buttonPressed(ch);
        },
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                output,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 38.0,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              margin: EdgeInsets.symmetric(vertical: 20.0),
            ),
            Expanded(
              child: Divider(),
            ),
            Row(
              children: <Widget>[     
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('/'),
              ],
            ),
            Row(
              children: <Widget>[     
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('*'),
              ],
            ),
            Row(
              children: <Widget>[     
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('-'),
              ],
            ),
            Row(
              children: <Widget>[     
                buildButton('.'),
                buildButton('0'),
                buildButton('00'),
                buildButton('+'),
              ],
            ),
            Row(
              children: <Widget>[     
                buildButton('Clear'),
                buildButton('='),
              ],
            )
          ],
        )
      )
    );
  }
}