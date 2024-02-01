import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/components/my_drawer.dart';
import 'package:musicplayer/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          title: const Text(
        'S E T T I N G S',
      )),
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(25),
        child: Row(children: [
          const Text('Dark Mode'),
          // switch
          // CupertinoSwitch(
          //   value:
          //       Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
          //   onChanged: (value) =>
          //       Provider.of<ThemeProvider>(context, listen: false)
          //           .toggleTheme(),
          // ),
          Switch(
            value:
                Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
            onChanged: (value) =>
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(),
          ),
        ]),
      ),
    );
  }
}
