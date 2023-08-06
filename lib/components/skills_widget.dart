import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';
import '../model/skills_model.dart';

class ListSkills extends StatelessWidget {
  final List<SkillsModel> skills;
  const ListSkills({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(LocaleKeys.skills.tr(),
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: skills.length,
          itemBuilder: (context, index) => Skill(skillsModel: skills[index]),
        ),
      ],
    );
  }
}

class Skill extends StatelessWidget {
  final SkillsModel skillsModel;
  const Skill({
    super.key,
    required this.skillsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skillsModel.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Wrap(
              children: skillsModel.skill
                  .map((skill) => Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Chip(
                          label: Text(skill.skill),
                          avatar: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                skill.icon,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) =>
                                    const SizedBox(),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
