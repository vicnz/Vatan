import 'package:flutter/material.dart';

Widget SampleBlock(BuildContext context,
    {String? sample, String? translation}) {
  ThemeData theme = Theme.of(context);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.primaryColor.withOpacity(.3),
          border: Border(
            left: BorderSide(
              width: 10,
              color: theme.primaryColor,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "\"${sample!}\"",
              style: TextStyle(color: theme.colorScheme.secondary),
            ),
            const Divider(),
            Text(
              translation!,
              style: TextStyle(color: theme.colorScheme.secondary),
            ),
          ],
        ),
      ),
    ),
  );
}

List<Widget> SampleList(context, List samples) {
  return [
    ...samples
        .map(
          (e) => SampleBlock(
            context,
            sample: e['sample'],
            translation: e['translation'],
          ),
        )
        .toList(),
  ];
}
