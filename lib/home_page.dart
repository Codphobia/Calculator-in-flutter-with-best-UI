import 'package:calculator/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var question = '';
  var answers = '';
  List<String> buttons = [
    'AC',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '0',
    '.',
    'ANS',
    '='
  ];

  bool operation(String x) {
    if (x == '%' || x == '/' || x == 'X' || x == '+' || x == '-' || x == '=') {
      return true;
    } else {
      return false;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      question,
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(answers,
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 23,
                        )),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    if ( index  ==0) {
                      return MyButton(
                        buttonText: buttons[index],
                        color: Colors.green,
                        txtColor: Colors.white,
                        buttonOntaped: () {
                          setState(() {
                            question = '';
                            answers = '';
                          });
                        },
                      );
                    } else if ( index  ==1) {
                      return MyButton(
                        buttonText: buttons[index],
                        color: Colors.red,
                        txtColor: Colors.white,
                        buttonOntaped: () {
                          setState(() {
                            question =
                                question.substring(0, question.length - 1);
                          });
                        },
                      );
                    } else if (index == buttons.length-1) {
                      return MyButton(
                        color: Colors.deepPurple,
                        txtColor: Colors.white,
                        buttonText: buttons[index],
                        buttonOntaped: () {
                          setState(() {
                            checked();
                          });
                        },
                      );
                    } else if (index == buttons.length-2) {
                      return MyButton(
                        color: Colors.white,
                        txtColor:Colors.deepPurple ,
                        buttonText: buttons[index],
                        buttonOntaped: () {
                          setState(() {
                            checked();
                          });
                        },
                      );
                    }else {
                      return MyButton(
                        buttonText: buttons[index],
                        color: (operation(buttons[index]))
                            ? Colors.deepPurple
                            : Colors.deepPurple[50],
                        txtColor: (operation(buttons[index]))
                            ? Colors.white
                            : Colors.deepPurple,
                        buttonOntaped: () {
                          setState(() {
                            question += buttons[index];
                          });
                        },
                      );
                    }
                  },
                ),
              )),
        ],
      ),
    );
  }
  void checked() {
    String finalQuestion = question;
    finalQuestion = finalQuestion.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answers = eval.toString();
  }
}
