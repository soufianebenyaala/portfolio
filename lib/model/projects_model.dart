// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProjectsModel extends Equatable {
  final String title;
  final String type;
  final String content;

  const ProjectsModel(
      {required this.title, required this.type, required this.content});

  @override
  List<Object> get props => [title, type, content];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'type': type,
      'content': content,
    };
  }

  factory ProjectsModel.fromMap(Map<String, dynamic> map) {
    return ProjectsModel(
        title: map['title'] as String,
        type: map['type'] as String,
        content: map['content'] as String);
  }

  String toJson() => json.encode(toMap());

  factory ProjectsModel.fromJson(String source) =>
      ProjectsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
