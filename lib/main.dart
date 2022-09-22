////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:provider/provider.dart';
import 'package:user_preferences/preferences/preferences.dart';
import 'package:user_preferences/providers/theme_provider.dart';
import "package:user_preferences/screens/screens.dart";
////////////////////////////////////////////////////////////////////////////////////////////////////
//Se convierte el método en async para poder usar el método async de Preferences, del cual se debe
//asegurar llamarlo al arranque, son las dos lineas del comentario a mas el async junto al main.
void main() async {
  //a
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  //end a
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>ThemeProvider(isDarkMode: Preferences.isDarkmode))
        ],
      child: const MyApp(),
    )
  );
}
////////////////////////////////////////////////////////////////////////////////////////////////////
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName    : (_) => const HomeScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////