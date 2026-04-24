import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsController extends GetxController {

  // 📦 Projects List
  final projects = <ProjectModel>[
    const ProjectModel(
      icon: Icons.check_circle_outline,
      iconColor: Colors.green, // 🎨 color added
      bannerColors: [Color(0xFF0D1A2B), Color(0xFF0A3050)],
      title: 'UbiAttendance',
      desc:
      'Enterprise attendance app with GPS location tracking, selfie verification, face recognition, and a complete leave management system.',
      tags: ['Flutter', 'GetX', 'Firebase', 'GPS'],
      playUrl:
      'https://play.google.com/store/apps/details?id=org.ubitech.attendance',
      appUrl:
      'https://apps.apple.com/in/app/track-employee-attendance/id1375252261',
    ),

    const ProjectModel(
      icon: Icons.badge_outlined,
      iconColor: Colors.purple, // 🎨 color added
      bannerColors: [Color(0xFF1A0D2B), Color(0xFF3A1060)],
      title: 'UbiHRM – Payroll App',
      desc:
      'Full HR management app with GPS attendance, selfie verification, face recognition, leave approval workflows, and payroll management.',
      tags: ['Flutter', 'GetX', 'Firebase', 'REST API'],
      playUrl:
      'https://play.google.com/store/apps/details?id=com.ubihrm.ubihrm',
      appUrl:
      'https://apps.apple.com/in/app/ubihrm/id1489689034',
    ),
  ];

  // 🔗 Launch URL safely
  Future<void> launchUrlExternal(String url) async {
    try {
      final uri = Uri.parse(url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication, // ✅ open in browser/store
        );
      } else {
        Get.snackbar(
          "Error",
          "Could not open link",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint("Launch error: $e");
    }
  }
}


// 📦 Project Model
class ProjectModel {
  final IconData icon;
  final Color iconColor; // 🎨 added
  final List<Color> bannerColors;
  final String title;
  final String desc;
  final List<String> tags;
  final String playUrl;
  final String appUrl;

  const ProjectModel({
    required this.icon,
    required this.iconColor,
    required this.bannerColors,
    required this.title,
    required this.desc,
    required this.tags,
    required this.playUrl,
    required this.appUrl,
  });
}