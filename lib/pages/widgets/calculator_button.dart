import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String btnTxt;
  final Color textColor;
  final Color backgroundColor;

  final void Function()? onPressed;

  const CalculatorButton({
    required this.btnTxt,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        onPressed: onPressed,
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
          btnTxt,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
