import 'package:flutter/material.dart';
import 'package:flutter_imdb/core/widgets/custom_widgets.dart';

class HomeSearchbar extends StatelessWidget {
  const HomeSearchbar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: 'Search movies...',
    );
  }
}
