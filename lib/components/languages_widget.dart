import 'package:flutter/material.dart';

class Languages extends StatelessWidget {
  final List<String> languages;
  const Languages({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Languages", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: languages
                    .map((language) => Chip(label: Text(language)))
                    .toList()),
          ),
        ),
      ],
    );
  }
}
