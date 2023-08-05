// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'certifications_model.dart';
import 'education_model.dart';
import 'experience_model.dart';
import 'formations_model.dart';
import 'projects_model.dart';
import 'skills_model.dart';

class PortfolioModel extends Equatable {
  final List<ExperienceModel> experience;
  final List<ProjectsModel> projects;
  final List<EducationModel> educations;
  final List<SkillsModel> skills;
  final List<CertificationsModel> certifications;
  final List<FormationsModel> formations;
  final String socialActivites;
  final List<String> languages;

  const PortfolioModel({
    required this.experience,
    required this.projects,
    required this.educations,
    required this.skills,
    required this.certifications,
    required this.formations,
    required this.socialActivites,
    required this.languages,
  });

  @override
  List<Object> get props => [];

  factory PortfolioModel.fromMap(Map<String, dynamic> map) {
    return PortfolioModel(
        experience: List<ExperienceModel>.from(
          (map['Experience'] as List).map<ExperienceModel?>(
            (x) => ExperienceModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        projects: List<ProjectsModel>.from(
          (map['Projects'] as List).map<ProjectsModel?>(
            (x) => ProjectsModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        educations: List<EducationModel>.from(
          (map['Education'] as List).map<EducationModel?>(
            (x) => EducationModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        skills: List<SkillsModel>.from(
          (map['Skills'] as List).map<SkillsModel?>(
            (x) => SkillsModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        certifications: List<CertificationsModel>.from(
          (map['Certifications'] as List).map<CertificationsModel?>(
            (x) => CertificationsModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        formations: List<FormationsModel>.from(
          (map['Formations'] as List).map<FormationsModel?>(
            (x) => FormationsModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        socialActivites: map['Social_activites'],
        languages: map['Languages'].cast<String>());
  }

  factory PortfolioModel.fromJson(String source) =>
      PortfolioModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
