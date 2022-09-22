////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import '../widgets/widgets.dart';
import 'package:user_preferences/providers/theme_provider.dart';
import '../preferences/preferences.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
class  SettingsScreen extends StatefulWidget {
  const SettingsScreen ({Key? key}) : super(key: key);

  static const String routeName = "settings";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //bool isDarkmode = Preferences.isDarkmode;
  //int  gender = Preferences.gender;
  //String name = "Pedro";

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("Settings Screen")),
        drawer: SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Ajustes",style: TextStyle(fontSize: 45,fontWeight: FontWeight.w300)),
                const Divider(),
                //para que se ajuste al sistema operativo que lo esté ejecutando
                SwitchListTile.adaptive(
                  title: const Text("DarkMode"),
                  value: Preferences.isDarkmode,
                  onChanged: (value){
                    Preferences.isDarkmode = value;
                    final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
                    value ? themeProvider.setDarkMode():themeProvider.setLightMode();
                    setState(() {});
                  }
                ),
                const Divider(),
                RadioListTile<int>(
                  title: const Text("Masculino"),
                  value: 1,
                  groupValue: Preferences.gender,
                  onChanged: (value){
                    Preferences.gender = value ?? 1; //si es null entoces 1
                    setState(() {});
                  }
                ),
                const Divider(),
                RadioListTile<int>(
                    title: const Text("Femenino"),
                    value: 2,
                    groupValue: Preferences.gender,//mismo group value que el anterior
                    onChanged: (value){
                      Preferences.gender = value ?? 2; //si es null entoces 2
                      setState(() {});
                    }
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    decoration: const InputDecoration(
                      labelText: "Nombre",
                      helperText: "Nombre del usuario"
                    ),
                    onChanged: (value){
                      Preferences.name = value;
                      setState(() { });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////