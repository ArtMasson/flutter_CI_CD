import 'dart:math';

import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

String expr = "";
double total = 0;

List<String> operators = ['C', 'π', '%', '+', '-', '*', '/'];

double getTotal() => total;

String calcLogic(String btnVal, BuildContext ctx) {
  switch (btnVal) {
    case 'C':
      expr = "";
      break;
    case '<':
      expr = expr.substring(0, expr.length - 1);
      break;
    case 'π':
      expr = '${expr}3.141592';
      break;
    case '=':
      _evaluate(expr, ctx, true);
      break;
    case '+':
      expr = expr + btnVal;
      break;
    case '\u2212':
      expr = expr + btnVal;
      break;
    case '/':
      expr = expr + btnVal;
      break;
    case '%':
      if (expr.isNotEmpty) {
        expr = '$expr/100';
        _evaluate(expr, ctx, true);
      }
      break;
    default:
      expr = expr + btnVal;
      _evaluate(expr, ctx, false);
  }
  return expr;
}

_evaluate(String xpression, BuildContext ctx, bool evaluateAll) {
  xpression = xpression.replaceAll('\u00d7', "*").replaceAll('\u2212', "-");
  xpression = xpression.replaceAll('\u2022', ".");
  xpression = xpression.replaceAll('\u0025', "^");

  late Expression expression;

  try {
    expression = Expression.parse(xpression);
  } on Exception {
    final snackBar = SnackBar(
      content: const Text('Operation error'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () => ScaffoldMessenger.of(ctx).removeCurrentSnackBar(),
      ),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }

  var context = {"^": exp, "cos": cos, "sin": sin};

  const evaluator = ExpressionEvaluator();
  var r = evaluator.eval(expression, context);

  if (evaluateAll) {
    expr =
        r.toString().length > 10 ? r.toString().substring(0, 10) : r.toString();
  }

  total = r;
}
