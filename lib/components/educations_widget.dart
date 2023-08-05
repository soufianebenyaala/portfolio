import 'package:flutter/material.dart';
import 'package:portfolio/model/education_model.dart';

class ListEducations extends StatelessWidget {
  final List<EducationModel> educations;
  const ListEducations({super.key, required this.educations});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Education", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: educations.length,
          itemBuilder: (context, index) =>
              Education(educationsModel: educations[index]),
        ),
      ],
    );
  }
}

class Education extends StatelessWidget {
  final EducationModel educationsModel;
  const Education({
    super.key,
    required this.educationsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            educationsModel.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            educationsModel.type,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "${educationsModel.startDate} - ${educationsModel.endDate} - ${educationsModel.school}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
