import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';

class Languages extends StatelessWidget {
  final List<String> languages;
  const Languages({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    print(LocaleKeys.languages.tr());
    return Column(
      children: [
        Text(LocaleKeys.languages.tr(),
            style: Theme.of(context).textTheme.titleLarge),
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
