import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  final scrollController = ScrollController();

  final heroKey       = GlobalKey();
  final aboutKey      = GlobalKey();
  final skillsKey     = GlobalKey();
  final projectsKey   = GlobalKey();
  final experienceKey = GlobalKey();
  final educationKey  = GlobalKey();
  final contactKey    = GlobalKey();

  void scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
