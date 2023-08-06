// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'package:portfolio/model/experience_model.dart';

import '../generated/locale_keys.g.dart';

class ListExperience extends StatelessWidget {
  final List<ExperienceModel> experiences;
  const ListExperience({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(LocaleKeys.experience.tr(),
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: experiences.length,
          itemBuilder: (context, index) =>
              Experience(experienceModel: experiences[index]),
        ),
      ],
    );
  }
}

class Experience extends StatelessWidget {
  final ExperienceModel experienceModel;
  const Experience({
    super.key,
    required this.experienceModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experienceModel.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            experienceModel.enterprise,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "${experienceModel.startDate} - ${experienceModel.endDate} - ${experienceModel.place}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: experienceModel.content.length,
            itemBuilder: (context, index) => ReadMoreText(
              "\u2022 ${experienceModel.content[index]}",
              textScaleFactor: 0.85,
              trimLines: 1,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: ' Show less',
              moreStyle: Theme.of(context).textTheme.bodySmall,
              lessStyle: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
