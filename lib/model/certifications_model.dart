import 'package:equatable/equatable.dart';

class CertificationsModel extends Equatable {
  final String title;
  final String? link;
  final String image;
  final String? date;
  final String source;
  const CertificationsModel({
    required this.title,
    required this.link,
    required this.image,
    required this.date,
    required this.source,
  });

  @override
  List<Object> get props => [title, source];

  factory CertificationsModel.fromMap(Map<String, dynamic> map) {
    return CertificationsModel(
      title: map['title'] as String,
      link: map['link'] != null ? map['link'] as String : null,
      image: map['image'] as String,
      date: map['date'] != null ? map['date'] as String : null,
      source: map['source'] as String,
    );
  }
}
