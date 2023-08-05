import 'package:flutter/material.dart';

class SocialActivites extends StatelessWidget {
  final String socialActivites;
  const SocialActivites({super.key, required this.socialActivites});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Social Activites", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(socialActivites),
        ),
      ],
    );
  }
}
