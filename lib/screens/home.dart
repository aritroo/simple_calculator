import 'package:flutter/material.dart';
import 'package:simple_calculator/widgets/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];
  var userQuestion = '';
  var userAnswer = '';
  bool isOperator(String c) {
    if (c == '%' || c == '/' || c == 'x' || c == '-' || c == '+' || c == '=') {
      return true;
    }
    return false;
  }

  void evaluate() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Claclulator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                    ),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      userQuestion,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 15.sp,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                    ),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      userAnswer,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 1.h,
              ),
              child: GridView.builder(
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return CustomButton(
                      onPressed: () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      },
                      color: Colors.green,
                      buttonText: buttons[index],
                      textColor: Colors.white,
                    );
                  } else if (index == 1) {
                    return CustomButton(
                      onPressed: () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                      color: Colors.red,
                      buttonText: buttons[index],
                      textColor: Colors.white,
                    );
                  } else if (index == buttons.length - 1) {
                    return CustomButton(
                      onPressed: () {
                        setState(() {
                          evaluate();
                        });
                      },
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple.shade50,
                      buttonText: buttons[index],
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                    );
                  } else {
                    return CustomButton(
                      onPressed: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple.shade50,
                      buttonText: buttons[index],
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                    );
                  }
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
