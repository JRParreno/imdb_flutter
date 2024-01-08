import 'package:flutter/material.dart';
import 'package:flutter_imdb/core/resources/theme/theme.dart';
import 'package:flutter_imdb/core/routes/routes.dart';
import 'package:flutter_imdb/features/home/presentation/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: MaterialAppThemes.darkTheme,
      theme: MaterialAppThemes.darkTheme,
      onGenerateRoute: generateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
