import 'package:flutter/material.dart';
import 'package:musicplayer/pages/home_page.dart';
import 'package:musicplayer/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [
        //logo
        DrawerHeader(
            child: Icon(
          Icons.music_note,
          size: 40,
          color: Theme.of(context).colorScheme.inversePrimary,
        )),
        //Home tile
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: ListTile(
              title: const Text('H o m e'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              }),
        ),
        // setting tile
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: ListTile(
            title: const Text('S e t t i n g s'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingPage(),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
