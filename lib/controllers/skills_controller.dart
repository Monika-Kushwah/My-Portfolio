import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillsController extends GetxController {
  final animatedValues = <double>[].obs;

  final skills = [
    SkillModel(Icons.flutter_dash, 'Flutter & Dart', 'Expert', 0.95, Colors.blue),
    SkillModel(Icons.flash_on, 'GetX', 'State Management', 0.90, Colors.purple),
    SkillModel(Icons.api, 'REST APIs', 'Advanced', 0.88, Colors.green),
    SkillModel(Icons.local_fire_department, 'Firebase', 'Advanced', 0.85, Colors.orange),
    SkillModel(Icons.architecture, 'MVC / Clean Arch.', 'Architecture', 0.85, Colors.teal),
    SkillModel(Icons.rocket_launch, 'App Deployment', 'Play Store & App Store', 0.92, Colors.red),
    SkillModel(Icons.location_on, 'GPS & Biometrics', 'Location & Auth', 0.80, Colors.pink),
    SkillModel(Icons.build, 'GitHub · Jira · Postman', 'Tools', 0.82, Colors.indigo),
  ];

  @override
  void onInit() {
    super.onInit();
    animatedValues.assignAll(List.filled(skills.length, 0.0));
  }

  void animate() {
    for (int i = 0; i < skills.length; i++) {
      Future.delayed(Duration(milliseconds: 120 * i), () {
        if (animatedValues[i] == 0) {
          animatedValues[i] = skills[i].percent; // ✅ now valid
        }
      });
    }
  }
}

class SkillModel {
  final IconData icon;
  final String name;     // ✅ renamed from title
  final String level;
  final double percent;  // ✅ added this
  final Color color;

  SkillModel(this.icon, this.name, this.level, this.percent, this.color);
}
