// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class EducationModel extends Equatable {
  final String title;
  final String type;
  final String school;
  final String startDate;
  final String endDate;
  const EducationModel({
    required this.title,
    required this.type,
    required this.school,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object> get props {
    return [
      title,
      type,
      school,
      startDate,
      endDate,
    ];
  }

  factory EducationModel.fromMap(Map<String, dynamic> map) {
    return EducationModel(
      title: map['title'] as String,
      type: map['type'] as String,
      school: map['school'] as String,
      startDate: map['start_date'] as String,
      endDate: map['end_date'] as String,
    );
  }

  factory EducationModel.fromJson(String source) =>
      EducationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
