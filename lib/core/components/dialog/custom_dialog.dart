import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  const CustomDialog({Key? key, this.title, this.content, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
        title: title,
        content: content,
        actions: actions);
  }
}
