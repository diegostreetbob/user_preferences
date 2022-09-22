////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:user_preferences/screens/screens.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class  SideMenu extends StatelessWidget {
  const SideMenu ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _DrawerHeader(),
            ListTile(
              leading: Icon(Icons.pages_outlined),
              title: Text("Home"),
              onTap: () {
                Navigator.pushReplacementNamed(context,HomeScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.people_outlined),
              title: Text("People"),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pushReplacementNamed(context,SettingsScreen.routeName);
              },
            ),
          ],
        ),
      );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        child: Container(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/menu-img.jpg"),
            fit: BoxFit.cover

        )
      )
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////