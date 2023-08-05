import 'package:equatable/equatable.dart';

class SkillsModel extends Equatable {
  final String title;
  final List<SkillModel> skill;
  const SkillsModel({
    required this.title,
    required this.skill,
  });

  @override
  List<Object> get props => [title, skill];

  factory SkillsModel.fromMap(Map<String, dynamic> map) {
    return SkillsModel(
      title: map['title'] as String,
      skill: List<SkillModel>.from(
        (map['content'] as List).map<SkillModel>(
          (x) => SkillModel.fromMap(x),
        ),
      ),
    );
  }
}

class SkillModel extends Equatable {
  final String skill;
  final String icon;
  const SkillModel({
    required this.skill,
    required this.icon,
  });

  @override
  List<Object> get props => [skill, icon];

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
      skill: map['skill'] as String,
      icon: map['icon'] as String,
    );
  }
}
