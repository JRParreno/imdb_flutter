import 'package:flutter/material.dart';
import 'package:flutter_imdb/core/utils/spacing/v_space.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Welcome ',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                    color: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.color!
                        .withOpacity(0.5)),
                children: <TextSpan>[
                  TextSpan(
                      text: '👋',
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            const Vspace(10),
            Text(
              "Let's relax and watch a movie",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D'),
        )
      ],
    );
  }
}
