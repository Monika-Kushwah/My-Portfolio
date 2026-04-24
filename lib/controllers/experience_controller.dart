import 'package:get/get.dart';

class ExperienceController extends GetxController {
  final experiences = <ExperienceModel>[
    ExperienceModel(
      period: 'June 2021',
      role: 'Mobile Developer Intern',
      company: 'Ubitech Solutions Pvt Ltd',
      isCurrent: false,
      points: [
        'Assisted in developing mobile app features using Flutter and Dart',
        'Learned Flutter widget lifecycle, state management, and clean code practices',
        'Collaborated with senior developers to implement UI designs from Figma',
        'Tested and debugged app features across Android and iOS devices',
      ],
    ),
    ExperienceModel(
      period: '2022',
      role: 'Junior Flutter Developer',
      company: 'Ubitech Solutions Pvt Ltd',
      isCurrent: false,
      points: [
        'Developed new screens and reusable UI components using Flutter',
        'Integrated REST APIs for enterprise mobile applications',
        'Implemented GetX for state management and route handling',
        'Fixed bugs and improved performance across multiple projects',
      ],
    ),
    ExperienceModel(
      period: '2023',
      role: 'Flutter Developer',
      company: 'Ubitech Solutions Pvt Ltd',
      isCurrent: false,
      points: [
        'Lead the development of UbiAttendance and UbiHRM apps from scratch',
        'Implemented GPS tracking, selfie verification, and face recognition features',
        'Integrated Firebase services including Auth, Firestore, and FCM push notifications',
        'Handled biometric authentication and document upload integrations',
      ],
    ),
    ExperienceModel(
      period: '2024',
      role: 'Senior Flutter Developer',
      company: 'Ubitech Solutions Pvt Ltd',
      isCurrent: false,
      points: [
        'Architected scalable Flutter apps using MVC and Clean Architecture patterns',
        'Mentored junior developers and conducted regular code reviews',
        'Optimised app performance by reducing build size and improving load times',
        'Managed Android and iOS build pipelines and handled Play Store and App Store submissions',
      ],
    ),
    ExperienceModel(
      period: '2025 – Present',
      role: 'Release Manager & Lead Software Engineer',
      company: 'Ubitech Solutions Pvt Ltd',
      isCurrent: true,
      points: [
        'Leading end-to-end delivery of enterprise mobile applications',
        'Managing Android and iOS release pipelines, versioning, and store deployments',
        'Overseeing team workflows via Jira and ClickUp, and version control via GitHub',
        'Driving architecture decisions and maintaining high code quality standards',
        'Handling all Play Store and App Store submissions, updates, and reviews',
      ],
    ),
  ];
}

class ExperienceModel {
  final String period;
  final String role;
  final String company;
  final bool isCurrent;
  final List<String> points;

  const ExperienceModel({
    required this.period,
    required this.role,
    required this.company,
    required this.isCurrent,
    required this.points,
  });
}
