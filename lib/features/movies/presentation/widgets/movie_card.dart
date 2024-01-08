import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_imdb/features/movies/domain/entities/titles.dart';
import 'package:gap/gap.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return SizedBox(
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: movie.primaryImage.imageUrl,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const Gap(10),
          Text(
            movie.titleText.text,
            style: themeContext.textTheme.labelSmall,
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
