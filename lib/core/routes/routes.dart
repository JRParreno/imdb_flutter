import 'package:flutter/material.dart';
import 'package:flutter_imdb/features/genres/presentation/genres_page.dart';
import 'package:flutter_imdb/features/home/presentation/screen/home_screen.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      switch (settings.name) {
        case HomeScreen.routeName:
          return const HomeScreen();
        case GenresPage.routeName:
          final args = settings.arguments! as GenresArguments;
          return GenresPage(args: args);
      }

      return const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Text('Something went wrong'),
        ),
      );
    },
  );
}
