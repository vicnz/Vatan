import 'package:flutter/material.dart';

Widget VariantBlock(
  context, {
  String title = 'default',
  Map<String, dynamic> content = const {},
}) {
  if (content["ilokano"] == null &&
      content["tagalog"] == null &&
      content["ivatan"] == null) {
    return const SizedBox();
  } else {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
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
    );
  }
}

Widget ChipBuilder(BuildContext context, String content, String type) {
  ThemeData theme = Theme.of(context);
  return Tooltip(
    message: type.toUpperCase(),
    triggerMode: TooltipTriggerMode.longPress,
    child: Chip(
      visualDensity: VisualDensity.compact,
      backgroundColor: theme.colorScheme.primary,
      label: Text(
        content,
        style: const TextStyle(color: Colors.white60),
      ),
    ),
  );
}
