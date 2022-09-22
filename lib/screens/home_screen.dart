////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:user_preferences/widgets/widgets.dart';
import '../preferences/preferences.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      drawer: SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("isDarkMode:${Preferences.isDarkmode} "),
          Divider(),
          Text("Género: ${Preferences.gender}"),
          Divider(),
          Text("Nombre de usuario:${Preferences.name} "),
          Divider(),
        ],
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
