import 'package:flutter/material.dart';

import '../model/projects_model.dart';

class ListProjects extends StatelessWidget {
  final List<ProjectsModel> projects;
  const ListProjects({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Projects", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 135,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: projects.length > 5 ? 5 : projects.length,
            itemBuilder: (context, index) =>
                Project(projectsModel: projects[index]),
          ),
        ),
      ],
    );
  }
}

class Project extends StatelessWidget {
  final ProjectsModel projectsModel;
  const Project({super.key, required this.projectsModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                projectsModel.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                projectsModel.type,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Expanded(
                child: Text(
                  projectsModel.content,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
