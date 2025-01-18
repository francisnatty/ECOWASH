import 'package:flutter/material.dart';

goTo({required BuildContext context, required Widget newScreen}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => newScreen),
  );
}

goToAndRemove({required BuildContext context, required Widget newScreen}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => newScreen),
    (Route<dynamic> route) => false,
  );
}

void popWidget({required BuildContext context}) {
  if (Navigator.canPop(context)) {
    Navigator.of(context).pop();
  }
}
