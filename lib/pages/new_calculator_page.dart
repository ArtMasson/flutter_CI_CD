import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/pages/helpers/app_colors.dart';

import 'helpers/calculator_helper.dart';

class NewCalculatorPage extends StatefulWidget {
  const NewCalculatorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewCalculatorPageState();
}

class _NewCalculatorPageState extends State<NewCalculatorPage> {
  String expr = "";
  String initial = "0";
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Output Text
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 35.0),
                alignment: Alignment.bottomRight,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      expr.isNotEmpty ? expr : initial,
                      style: const TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayLightColor,
                      ),
                    ),
                    Visibility(
                      visible: expr.isNotEmpty,
                      child: Text(
                        '= $total',
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textLightColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            // Row 1 Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn(
                  buttonText: 'C',
                  textColor: AppColors.backgroundDark,
                  backgroundColor: AppColors.grayLightColor,
                ),
                _buildBtn(
                  buttonText: "π",
                  textColor: AppColors.backgroundDark,
                  backgroundColor: AppColors.grayLightColor,
                ),
                _buildBtn(
                  buttonText: "%",
                  textColor: AppColors.backgroundDark,
                  backgroundColor: AppColors.grayLightColor,
                ),
                _buildBtn(
                  buttonText: '\u00d7',
                  textColor: AppColors.backgroundLight,
                  backgroundColor: AppColors.orangeColor,
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn(
                  buttonText: '7',
                  textColor: AppColors.grayLightColor,
                  backgroundColor: AppColors.grayColor,
                ),
                _buildBtn(
                  buttonText: '8',
                  textColor: AppColors.grayLightColor,
                  backgroundColor: AppColors.grayColor,
                ),
                _buildBtn(
                  buttonText: '9',
                  textColor: AppColors.grayLightColor,
                  backgroundColor: AppColors.grayColor,
                ),
                _buildBtn(
                  buttonText: '\u002f',
                  textColor: AppColors.backgroundLight,
                  backgroundColor: AppColors.orangeColor,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn(
                  buttonText: '4',
                  textColor: AppColors.grayLightColor,
                  backgroundColor: AppColors.grayColor,
                ),
                _buildBtn(
                  buttonText: '5',
                  textColor: AppColors.grayLightColor,
                  backgroundColor: AppColors.grayColor,
                ),
                _buildBtn(
                  buttonText: '6',
                  textColor: AppColors.grayLightColor,
                  backgroundColor: AppColors.grayColor,
                ),
                _buildBtn(
                  buttonText: '\u2212',
                  textColor: AppColors.backgroundLight,
                  backgroundColor: AppColors.orangeColor,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn(
                  buttonText: '1',
                  textColor: AppColors.grayLightColor,
                  backgroundColor: AppColors.grayColor,
                ),
                _buildBtn(
                  buttonText: '2',
                  textColor: AppColors.grayLightColor,
                  backgroundColor: AppColors.grayColor,
                ),
                _buildBtn(
                  buttonText: '3',
                  textColor: AppColors.grayLightColor,
                  backgroundColor: AppColors.grayColor,
                ),
                _buildBtn(
                  buttonText: '\u002b',
                  textColor: AppColors.backgroundLight,
                  backgroundColor: AppColors.orangeColor,
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn(
                  buttonText: '0',
                  textColor: AppColors.grayLightColor,
                  backgroundColor: AppColors.grayColor,
                  expanded: true,
                ),
                _buildBtn(
                  buttonText: '.',
                  textColor: AppColors.grayLightColor,
                  backgroundColor: AppColors.grayColor,
                ),
                _buildBtn(
                  buttonText: '\u003d',
                  textColor: AppColors.backgroundLight,
                  backgroundColor: AppColors.orangeColor,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  _buildBtn({
    required String buttonText,
    required Color textColor,
    required Color backgroundColor,
    bool expanded = false,
  }) {
    return Container(
      height: 80,
      width: expanded ? 200 : 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            expr = calcLogic(buttonText, context);
            total = getTotal();
          });
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(textColor),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
