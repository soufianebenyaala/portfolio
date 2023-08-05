import 'package:flutter/material.dart';

class SectionKeyAndNameModel {
  final String name;
  final GlobalKey key = GlobalKey();
  SectionKeyAndNameModel({
    required this.name,
  });
}
