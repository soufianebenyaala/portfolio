// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExperienceModel extends Equatable {
  final String title;
  final String enterprise;
  final String startDate;
  final String endDate;
  final String place;
  final List<String> content;

  const ExperienceModel({
    required this.title,
    required this.enterprise,
    required this.startDate,
    required this.endDate,
    required this.place,
    required this.content,
  });

  @override
  List<Object> get props {
    return [title, enterprise, startDate, endDate, place, content];
  }

  factory ExperienceModel.fromMap(Map<String, dynamic> map) {
    return ExperienceModel(
      title: map['title'] as String,
      enterprise: map['enterprise'] as String,
      startDate: map['start_date'] as String,
      endDate: map['end_date'] as String,
      place: map['place'] as String,
      content: map['content'].cast<String>(),
    );
  }

  factory ExperienceModel.fromJson(String source) =>
      ExperienceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
