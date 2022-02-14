import 'package:flutter/material.dart';
import 'package:path/path.dart';

Widget PageLogo(BuildContext context,
    {double? size = 25, Color color = Colors.white}) {
  return Image.asset(
    join("assets", "logo.png"),
    alignment: Alignment.center,
  );
}
