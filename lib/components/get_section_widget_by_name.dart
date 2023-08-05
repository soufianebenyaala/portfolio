import 'package:flutter/material.dart';
import 'package:portfolio/model/portfolio_model.dart';

import '../components/Experience_widget.dart';
import '../components/certifications_widget.dart';
import '../components/educations_widget.dart';
import '../components/formations_widget.dart';
import '../components/languages_widget.dart';
import '../components/project_widget.dart';
import '../components/skills_widget.dart';
import '../components/social_activites_widget.dart';

class GetSectionWidgetByName extends StatelessWidget {
  final PortfolioModel? portfolio;
  final SectionKeyAndNameModel sectionKeyAndNameModel;
  const GetSectionWidgetByName({
    Key? key,
    required this.portfolio,
    required this.sectionKeyAndNameModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (sectionKeyAndNameModel.name) {
      case "Experience":
        return ListExperience(
          experiences: portfolio!.experience,
          key: sectionKeyAndNameModel.key,
        );
      case "Projects":
        return ListProjects(
          projects: portfolio!.projects,
          key: sectionKeyAndNameModel.key,
        );
      case "Education":
        return ListEducations(
          educations: portfolio!.educations,
          key: sectionKeyAndNameModel.key,
        );
      case "Skills":
        return ListSkills(
          skills: portfolio!.skills,
          key: sectionKeyAndNameModel.key,
        );
      case "Certifications":
        return ListCertifications(
          certifications: portfolio!.certifications,
          key: sectionKeyAndNameModel.key,
        );
      case "Formations":
        return ListFormations(
          formations: portfolio!.formations,
          key: sectionKeyAndNameModel.key,
        );
      case "Social_activites":
        return SocialActivites(
          socialActivites: portfolio!.socialActivites,
          key: sectionKeyAndNameModel.key,
        );
      case "Languages":
        return Languages(
          languages: portfolio!.languages,
          key: sectionKeyAndNameModel.key,
        );
      default:
        return const SizedBox();
    }
  }
}
