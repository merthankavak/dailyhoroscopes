import 'package:flutter/material.dart';

import 'normal_button.dart';

class TitleTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final TextStyle? textStyle;

  const TitleTextButton({Key? key, required this.child, this.onPressed, this.style, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalButton(onPressed: onPressed, style: style, child: child);
  }
}
