import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    this.onPressed,
    this.highlighColor = false,
    this.text,
    this.child,
    this.padding = const EdgeInsets.fromLTRB(55, 15, 55, 15),
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final bool highlighColor;
  final EdgeInsets padding;

  Color get backgroundColor {
    return highlighColor ? darkBrown : Colors.white;
  }

  Color get textColor {
    return highlighColor ? Colors.white : darkBrown;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: key,
      onPressed: onPressed,
      child: child != null
          ? child ?? SizedBox()
          : Text(
              text ?? '',
              style: TextStyle(color: textColor),
            ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor,
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: darkBrown),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(padding),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
    );
  }
}
