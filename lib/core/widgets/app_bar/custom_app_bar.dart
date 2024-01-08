import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget customAppBar({
  required BuildContext context,
  required String title,
}) {
  final themeContext = Theme.of(context);

  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    title: Text(
      title,
      style: themeContext.textTheme.titleMedium,
    ),
  );
}
