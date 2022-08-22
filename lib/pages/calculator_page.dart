import 'package:flutter/material.dart';

import 'helpers/calculator_helper.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String expr = "";
  String initial = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Output Text
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 35.0, bottom: 70.0),
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: Text(
                  expr.isNotEmpty ? expr : initial,
                  style: const TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Row 1 Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBtn(
                    buttonText: 'C',
                    textColor: Colors.white,
                    backgroundColor: const Color.fromRGBO(247, 184, 68, 1),
                  ),
                  _buildBtn(
                    buttonText: "\u03C0",
                    textColor: const Color.fromRGBO(202, 163, 86, 1),
                    backgroundColor: const Color.fromRGBO(246, 240, 226, 1),
                  ),
                  _buildBtn(
                    buttonText: "\u0065",
                    textColor: const Color.fromRGBO(202, 163, 86, 1),
                    backgroundColor: const Color.fromRGBO(246, 240, 226, 1),
                  ),
                  _buildBtn(
                    buttonText: '\u00d7',
                    textColor: const Color.fromRGBO(102, 50, 156, 1),
                    backgroundColor: const Color.fromRGBO(225, 213, 233, 1),
                  ),
                ],
              ),
            ),

            // Row 2 Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBtn(
                    buttonText: '7',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '8',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '9',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '\u002f',
                    textColor: const Color.fromRGBO(102, 50, 156, 1),
                    backgroundColor: const Color.fromRGBO(225, 213, 233, 1),
                  ),
                ],
              ),
            ),

            // Row 3 Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBtn(
                    buttonText: '4',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '5',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '6',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '\u2212',
                    textColor: const Color.fromRGBO(102, 50, 156, 1),
                    backgroundColor: const Color.fromRGBO(225, 213, 233, 1),
                  ),
                ],
              ),
            ),

            // Row 4 Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBtn(
                    buttonText: '1',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '2',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '3',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '\u002b',
                    textColor: const Color.fromRGBO(102, 50, 156, 1),
                    backgroundColor: const Color.fromRGBO(225, 213, 233, 1),
                  ),
                ],
              ),
            ),

            // Row 5 Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBtn(
                    buttonText: '\u2022',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '0',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '\u232b',
                    textColor: Colors.black45,
                    backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
                  ),
                  _buildBtn(
                    buttonText: '\u003d',
                    textColor: Colors.white,
                    backgroundColor: const Color.fromRGBO(157, 76, 241, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A function for creating buttons
  _buildBtn({
    required buttonText,
    required textColor,
    required backgroundColor,
  }) {
    return Container(
      height: 73,
      width: 80,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 2.0,
            // spreadRadius: 1.5,
            offset: Offset(
              -2.0,
              -2.0,
            ),
          ),
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            // spreadRadius: 1.5,
            offset: Offset(
              2.0,
              2.0,
            ),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            expr = calcLogic(buttonText, context);
          });
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38.0),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(textColor),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor,
          ),
        ),
        child: Text(
          "$buttonText",
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
