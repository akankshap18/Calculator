import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});
  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double fNum = 0.0;
  double sNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClicked(value) {
    if(value == "AC") {
      input = '';
      output = '';
    }
    else if(value == "<") {
      if(input.isNotEmpty) {
        input = input.substring(0, input.length-1);
      }
    }
    else if(value == "=") {
      if(input.isNotEmpty){
        var userInput = input;
        userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();
        if(output.endsWith(".0")) {
          output = output.substring(0, output.length-2);
        }
        input = output;
        hideInput = true;
        outputSize = 52;
      }
    }
    else {
      input = input + value;
      hideInput = false;
      outputSize = 34;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(hideInput ? '' : input, style: const TextStyle(
                          fontSize: 48,
                          color: Colors.white),
                      ),

                      SizedBox(height: 20,),

                      Text(output, style: TextStyle(
                          fontSize: outputSize,
                          color: Colors.white.withOpacity(0.7)),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
              ),
          ),

          Row(
            children: [
              button(text: "AC", buttonColor: Colors.blueGrey, tColor: Colors.orangeAccent),
              button(text: "<", buttonColor: Colors.blueGrey, tColor: Colors.orangeAccent),
              button(text: "", buttonColor: Colors.transparent),
              button(text: "/", buttonColor: Colors.blueGrey, tColor: Colors.orangeAccent),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "x", buttonColor: Colors.blueGrey, tColor: Colors.orangeAccent),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-", buttonColor: Colors.blueGrey, tColor: Colors.orangeAccent),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+", buttonColor: Colors.blueGrey, tColor: Colors.orangeAccent),
            ],
          ),
          Row(
            children: [
              button(text: "%", buttonColor: Colors.blueGrey, tColor: Colors.orangeAccent),
              button(text: "0"),
              button(text: "."),
              button(text: "=", buttonColor: Colors.orangeAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    text, tColor = Colors.white,
    buttonColor = Colors.grey
}) {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(22),
                  backgroundColor: buttonColor),
              onPressed: () => onButtonClicked(text) ,
              child:  Text(text, style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              ),
            ),
        ),
    );
  }
}
