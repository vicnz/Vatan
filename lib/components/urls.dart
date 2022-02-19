import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ivatan_dictionary/states/appinfo.dart';

Widget URLs(BuildContext context) {
  ThemeData theme = Theme.of(context);

  return Wrap(
    runSpacing: 5,
    spacing: 10,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: [
      OutlinedButton.icon(
        icon: const Icon(Icons.menu_book_outlined),
        onPressed: () async {
          if (!await launch(resourceUrl)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Failed To Launch $resourceUrl",
                  style: TextStyle(
                    color: theme.colorScheme.background,
                  ),
                ),
              ),
            );
          }
        },
        label: const Text("Resources"),
      ),

      /// GITHUB REPO
      OutlinedButton.icon(
        icon: const Icon(Icons.code_rounded),
        onPressed: () async {
          if (!await launch(githubUrl)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Failed To Launch $githubUrl",
                  style: TextStyle(
                    color: theme.colorScheme.background,
                  ),
                ),
              ),
            );
          }
        },
        label: const Text("Github"),
      ),

      /// EMAIL
      OutlinedButton.icon(
        icon: const Icon(Icons.mail_outline_rounded),
        onPressed: () async {
          if (!await launch(emailUrl)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Failed To Launch $emailUrl",
                  style: TextStyle(
                    color: theme.colorScheme.background,
                  ),
                ),
              ),
            );
          }
        },
        label: const Text("Email"),
      ),
    ],
  );
}
