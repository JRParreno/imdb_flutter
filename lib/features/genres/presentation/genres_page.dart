import 'package:flutter/material.dart';
import 'package:flutter_imdb/core/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_imdb/core/widgets/button/pill_button.dart';
import 'package:flutter_imdb/features/genres/data/models/genre_model.dart';

class GenresArguments {
  final GenresData genresData;

  GenresArguments(this.genresData);
}

class GenresPage extends StatefulWidget {
  static const String routeName = '/genres';
  final GenresArguments args;
  const GenresPage({
    super.key,
    required this.args,
  });

  @override
  State<GenresPage> createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Select Categories',
        context: context,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 25,
          runSpacing: 30,
          children: widget.args.genresData.allGenres
              .map((data) => SizedBox(
                  height: 30, child: PillButton(title: data, onPressed: () {})))
              .toList()
              .cast<Widget>(),
        ),
      ),
    );
  }
}
