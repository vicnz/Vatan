import 'package:flutter/material.dart';
import 'package:ivatan_dictionary/components/animations/PageTransition.dart'
    show PageTransition;
import 'package:ivatan_dictionary/preview.dart' show PreviewPage;

Widget Block(
  BuildContext context, {
  String title = "Default",
  Object? content,
}) {
  ThemeData theme = Theme.of(context);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (content.runtimeType != List<dynamic>)
          //Title
          Text(
            title,
            style: TextStyle(
              color: theme.colorScheme.onSecondary,
              fontSize: theme.textTheme.headline6?.fontSize,
            ),
          )
        else
          const SizedBox(),
        const SizedBox(height: 10),
        //If content type is string return Text
        if (content.runtimeType == String)
          Text(
            content.toString(),
            style: TextStyle(color: theme.colorScheme.onPrimary),
          )
        //else if content type is List return Wrap
        else if (content.runtimeType == List<dynamic>)
          Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              Chip(
                label: Text(
                  "$title:",
                  style: TextStyle(
                    color: theme.colorScheme.background,
                  ),
                ),
                backgroundColor: theme.colorScheme.primary,
              ),
              ...(content as List)
                  .map(
                    (e) => TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            theme.colorScheme.onPrimary),
                      ),
                      child: Text(e),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            page: PreviewPage(
                              word: e,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            ],
          )
        else
          const SizedBox(),
      ],
    ),
  );
}
