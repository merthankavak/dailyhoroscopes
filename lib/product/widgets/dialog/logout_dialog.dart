import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/dialog/custom_dialog.dart';
import '../../../core/init/lang/locale_keys.g.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback? onPressedContinue;
  final VoidCallback? onPressedCancel;

  const LogoutDialog({super.key, this.onPressedContinue, this.onPressedCancel});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        title:
            Text(LocaleKeys.home_alert_title.tr(), style: Theme.of(context).textTheme.bodyLarge!),
        content:
            Text(LocaleKeys.home_alert_desc.tr(), style: Theme.of(context).textTheme.bodyMedium!),
        actions: [
          TextButton(
              onPressed: onPressedContinue,
              child: Text(LocaleKeys.home_alert_continue.tr(),
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium!
                      .copyWith(color: context.colorScheme.onPrimary))),
          TextButton(
              onPressed: onPressedCancel,
              child: Text(LocaleKeys.home_alert_cancel.tr(),
                  textAlign: TextAlign.center,
                  style:
                      context.textTheme.bodyMedium!.copyWith(color: context.colorScheme.onPrimary)))
        ]);
  }
}
