import 'package:flutter/material.dart';
import 'package:ivatan_dictionary/components/animations/heartanimation.dart';
import 'package:ivatan_dictionary/states/providers.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class PreviewHeader extends StatefulWidget {
  PreviewHeader(
      {Key? key, required this.word, required this.isFavorite, this.origin})
      : super(key: key);
  String word;
  String? origin;
  num isFavorite;

  @override
  _PreviewHeaderState createState() => _PreviewHeaderState();
}

class _PreviewHeaderState extends State<PreviewHeader>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MediaQueryData window = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          alignment: Alignment.center,
          height: 100,
          color: theme.colorScheme.primary,
          width: window.size.width,
          child: Stack(
            children: [
              Positioned.fill(
                bottom: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    join("assets/", "background.png"),
                    alignment: Alignment.bottomRight,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.word.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: theme.textTheme.headline6?.fontSize,
                            fontWeight: theme.textTheme.headline6?.fontWeight,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          (widget.origin.runtimeType == null ||
                                  widget.origin!.isEmpty)
                              ? widget.origin!
                              : "N/A",
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    HeartAnimation(
                      isFavorite: widget.isFavorite,
                      word: widget.word,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget PreviewHeader(BuildContext context,
//     {required String word, String? origin}) {
//   ThemeData theme = Theme.of(context);
//   MediaQueryData window = MediaQuery.of(context);
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(18),
//       child: Container(
//         alignment: Alignment.center,
//         height: 100,
//         color: theme.colorScheme.primary,
//         width: window.size.width,
//         child: Stack(
//           children: [
//             Positioned.fill(
//               bottom: 0,
//               right: 0,
//               child: Opacity(
//                 opacity: 0.6,
//                 child: Image.asset(
//                   join("assets/", "background.png"),
//                   alignment: Alignment.bottomRight,
//                   fit: BoxFit.scaleDown,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         word.toUpperCase(),
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: theme.textTheme.headline6?.fontSize,
//                           fontWeight: theme.textTheme.headline6?.fontWeight,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         origin ?? "N/A",
//                         style: const TextStyle(
//                           fontStyle: FontStyle.italic,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   IconButton(
//                     icon: const Icon(
//                       Icons.favorite_outline_rounded,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {},
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
