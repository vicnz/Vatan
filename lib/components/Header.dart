import 'package:flutter/material.dart';
import 'package:ivatan_dictionary/components/Logo.dart';
import 'package:ivatan_dictionary/states/modeTheme.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:ivatan_dictionary/states/appinfo.dart';

///

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool mode = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData window = MediaQuery.of(context);
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        showAboutDialog(
          context: context,
          applicationIcon: SizedBox(
            height: 75,
            width: 75,
            child: PageLogo(context),
          ),
          applicationLegalese: appLegal,
          applicationVersion: appVersion,
          applicationName: appName,
          useRootNavigator: true,
          children: [
            const Divider(),
            ...(appDetails.map(
              (detail) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    Text(detail),
                    const SizedBox(height: 15),
                  ],
                );
              },
            ).toList()),
            Consumer<ThemeModeState>(
              builder: (BuildContext context, state, child) {
                return Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Theme on \"${(state.mode == ThemeMode.light) ? "Light" : "Dark"}\"",
                        ),
                        const SizedBox(height: 5),
                        Switch(
                          activeColor: theme.colorScheme.primary,
                          value: (state.mode == ThemeMode.light),
                          onChanged: (bool value) {
                            // print(state.mode);
                            if (state.mode == ThemeMode.light) {
                              state.useDark();
                            } else {
                              state.useLight();
                            }
                          },
                        ),
                      ]),
                );
              },
            ),
          ],
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: 200,
            width: window.size.width,
            color: theme.colorScheme.primary,
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 0,
                  right: 0,
                  child: Opacity(
                    opacity: .4,
                    child: Image.asset(
                      join("assets/", "background.png"),
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Ivatan Dictionary",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: theme.textTheme.headline4?.fontSize,
                          fontWeight: theme.textTheme.headline4?.fontWeight,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        appDetails[0],
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const Text(
                        "There Are 5,000K Words",
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
