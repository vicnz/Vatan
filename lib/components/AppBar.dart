import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SliverAppBar AppBarSection(
  BuildContext context,
  Widget leading, {
  String title = "VATAN",
}) {
  ThemeData theme = Theme.of(context);
  /// SET SYSTEM BARS TRANSPARENT
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: theme.colorScheme.primary,
    ),
  );
  return SliverAppBar(
    backgroundColor: theme.colorScheme.background,
    leadingWidth: 55,
    leading: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: leading,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: theme.colorScheme.onPrimary,
        fontSize: theme.appBarTheme.titleTextStyle?.fontSize,
        fontWeight: theme.appBarTheme.titleTextStyle?.fontWeight,
      ),
    ),
  );
}
