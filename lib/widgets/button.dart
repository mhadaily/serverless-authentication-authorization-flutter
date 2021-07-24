import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    this.onPressed,
    this.text,
    this.child,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      child: child != null
          ? child ?? SizedBox()
          : Text(
              text ?? '',
            ),
    );
  }
}
