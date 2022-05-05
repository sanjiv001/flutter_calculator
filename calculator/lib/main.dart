import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      color: Colors.blue,
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        equation = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;

      } else if (buttonText == "×") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        // expression = expression.replaceAll('*', '*');
        // expression = expression.replaceAll('/', '/');

        try {
          Parser p =  Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, Colors.red),
                        buildButton("×", 1, Colors.blue),
                        buildButton("÷", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("7", 1, Colors.blue),
                        buildButton("	8", 1, Colors.blue),
                        buildButton("9", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("4", 1, Colors.blue),
                        buildButton("5", 1, Colors.blue),
                        buildButton("6", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("1", 1, Colors.blue),
                        buildButton("2", 1, Colors.blue),
                        buildButton("3", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(".", 1, Colors.blue),
                        buildButton("0", 1, Colors.blue),
                        buildButton("00", 1, Colors.blue),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("*", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("+", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("=", 2, Color.fromARGB(255, 186, 18, 18)),
                    ])
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
