import 'package:flutter/material.dart';
import 'package:ivatan_dictionary/components/Logo.dart';
import 'package:ivatan_dictionary/states/ModeTheme.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

///
const appVersion = "10.0";
const appName = "Vatan";
const appLegal = "LTS Palo-Alto";
const appDetails = "";

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool mode = false;
  @override
  void initState() {
    super.initState();
  }

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
            const SizedBox(height: 15),
            const Text(
              "Minim tempor sanctus lorem stet ipsum takimata dolor et dolores aliquam nulla duis rebum adipiscing. Esse duo justo eirmod clita et in at magna vel labore kasd nonummy no in. Autem magna vero sea.",
            ),
            const Divider(),
            const Text(
              "There are about 5,000K words here (hopefully) since there is still a need to fetch certain data and other stuffs",
            ),
            const Divider(),
            const SizedBox(height: 5),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      const Text(
                        "Minim tempor sanctus lorem stet ipsum takimata dolor et dolores aliquam nulla duis rebum adipiscing. Esse duo justo eirmod clita et in at magna vel labore kasd nonummy no in. Autem magna vero sea.",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const Text(
                        "There Are 5,000K Words",
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
