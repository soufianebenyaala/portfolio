import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';

class SocialActivites extends StatelessWidget {
  final String socialActivites;
  const SocialActivites({super.key, required this.socialActivites});

  @override
  Widget build(BuildContext context) {
    print(LocaleKeys.activities.tr());

    return Column(
      children: [
        Text(LocaleKeys.activities.tr(),
            style: Theme.of(context).textTheme.titleLarge),
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
