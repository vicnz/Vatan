import 'package:flutter/material.dart';

Widget VariantBlock(
  context, {
  String title = 'default',
  Map<String, dynamic> content = const {},
}) {
  ThemeData theme = Theme.of(context);
  if (content["ilokano"] == null &&
      content["tagalog"] == null &&
      content["ivatan"] == null) {
    return const SizedBox();
  } else {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          runSpacing: 10,
          spacing: 5,
          children: [
            (content['ilokano'] != null)
                ? ChipBuilder(context, content['ilokano'], "Ilokano")
                : const SizedBox(),
            (content['ivatan'] != null)
                ? ChipBuilder(context, content['ivatan'], "Ivatan")
                : const SizedBox(),
            (content['tagalog'] != null)
                ? ChipBuilder(context, content['tagalog'], "Tagalog")
                : const SizedBox(),
          ],
        ),
        Divider( color: theme.primaryColor),
      ],
    );
  }
}

Widget ChipBuilder(BuildContext context, String content, String type) {
  ThemeData theme = Theme.of(context);
  return Tooltip(
    message: type.toUpperCase(),
    triggerMode: TooltipTriggerMode.tap,
    child: Chip(
      visualDensity: VisualDensity.compact,
      backgroundColor: theme.colorScheme.onSecondary,
      label: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
