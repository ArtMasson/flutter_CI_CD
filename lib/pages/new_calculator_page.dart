import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/pages/helpers/app_colors.dart';

import 'helpers/calculator_helper.dart';

enum ButtonThemeEnum {
  utility,
  number,
  operation,
}

class NewCalculatorPage extends StatefulWidget {
  const NewCalculatorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewCalculatorPageState();
}

class _NewCalculatorPageState extends State<NewCalculatorPage> {
  String expr = "";
  String initial = "0";
  double total = 0;
  bool showSecondLabel = true;

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
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FittedBox(
                      child: Text(
                        expr.isNotEmpty ? expr : initial,
                        style: const TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grayLightColor,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: expr.isNotEmpty && showSecondLabel,
                      child: Text(
                        '= $total',
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textLightColor,
                          overflow: TextOverflow.clip,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBtn(
                  buttonText: 'C',
                  theme: ButtonThemeEnum.utility,
                ),
                _buildBtn(
                  buttonText: "π",
                  theme: ButtonThemeEnum.utility,
                ),
                _buildBtn(
                  buttonText: "%",
                  theme: ButtonThemeEnum.utility,
                ),
                _buildBtn(
                  buttonText: '\u00d7',
                  theme: ButtonThemeEnum.operation,
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
                  theme: ButtonThemeEnum.number,
                ),
                _buildBtn(
                  buttonText: '8',
                  theme: ButtonThemeEnum.number,
                ),
                _buildBtn(
                  buttonText: '9',
                  theme: ButtonThemeEnum.number,
                ),
                _buildBtn(
                  buttonText: '\u002f',
                  theme: ButtonThemeEnum.operation,
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
                  theme: ButtonThemeEnum.number,
                ),
                _buildBtn(
                  buttonText: '5',
                  theme: ButtonThemeEnum.number,
                ),
                _buildBtn(
                  buttonText: '6',
                  theme: ButtonThemeEnum.number,
                ),
                _buildBtn(
                  buttonText: '\u2212',
                  theme: ButtonThemeEnum.operation,
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
                  theme: ButtonThemeEnum.number,
                ),
                _buildBtn(
                  buttonText: '2',
                  theme: ButtonThemeEnum.number,
                ),
                _buildBtn(
                  buttonText: '3',
                  theme: ButtonThemeEnum.number,
                ),
                _buildBtn(
                  buttonText: '\u002b',
                  theme: ButtonThemeEnum.operation,
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
                  theme: ButtonThemeEnum.number,
                  expanded: true,
                ),
                _buildBtn(
                  buttonText: '.',
                  theme: ButtonThemeEnum.number,
                ),
                _buildBtn(
                  buttonText: '\u003d',
                  theme: ButtonThemeEnum.operation,
                  onPressed: () {
                    showSecondLabel = false;
                    expr = "";
                  },
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
    required ButtonThemeEnum theme,
    Function? onPressed,
    bool expanded = false,
  }) {
    Color foregroundColor;
    Color backgroundColor;
    onPressed = onPressed ?? () {};

    switch (theme) {
      case ButtonThemeEnum.utility:
        foregroundColor = AppColors.backgroundDark;
        backgroundColor = AppColors.grayLightColor;
        break;
      case ButtonThemeEnum.operation:
        foregroundColor = AppColors.backgroundLight;
        backgroundColor = AppColors.orangeColor;
        break;
      default:
        foregroundColor = AppColors.grayLightColor;
        backgroundColor = AppColors.grayColor;
        onPressed = () {
          showSecondLabel = true;
        };
    }

    return Container(
      height: 80,
      width: expanded ? 200 : 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed!();
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
          foregroundColor: MaterialStateProperty.all(foregroundColor),
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
