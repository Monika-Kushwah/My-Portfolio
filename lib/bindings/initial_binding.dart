import 'package:get/get.dart';
import '../controllers/nav_controller.dart';
import '../controllers/contact_controller.dart';
import '../controllers/skills_controller.dart';
import '../controllers/experience_controller.dart';
import '../controllers/projects_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavController>(() => NavController(), fenix: true);
    Get.lazyPut<ContactController>(() => ContactController(), fenix: true);
    Get.lazyPut<SkillsController>(() => SkillsController(), fenix: true);
    Get.lazyPut<ExperienceController>(() => ExperienceController(), fenix: true);
    Get.lazyPut<ProjectsController>(() => ProjectsController(), fenix: true);
  }
}
