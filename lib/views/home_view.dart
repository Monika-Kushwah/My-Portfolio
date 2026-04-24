import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';
import '../constants/app_colors.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/experience_section.dart';
import 'sections/education_section.dart';
import 'sections/contact_section.dart';

class HomeView extends GetView<NavController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                // const SizedBox(height: 40),
                HeroSection(key: controller.heroKey),
                AboutSection(key: controller.aboutKey),
                SkillsSection(key: controller.skillsKey),
                ProjectsSection(key: controller.projectsKey),
                ExperienceSection(key: controller.experienceKey),
                EducationSection(key: controller.educationKey),
                ContactSection(key: controller.contactKey),
                _footer(),
              ],
            ),
          ),
          _NavBar(),
        ],
      ),
    );
  }

  Widget _footer() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.border))),
        child: const Text(
          'Monika Kushwah · Flutter Developer · 2026',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textMuted, fontSize: 13),
        ),
      );
}

class _NavBar extends GetView<NavController> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final items = [
      _NavItem('About',      () => controller.scrollTo(controller.aboutKey)),
      _NavItem('Skills',     () => controller.scrollTo(controller.skillsKey)),
      _NavItem('Projects',   () => controller.scrollTo(controller.projectsKey)),
      _NavItem('Experience', () => controller.scrollTo(controller.experienceKey)),
      _NavItem('Education',  () => controller.scrollTo(controller.educationKey)),
      _NavItem('Contact',    () => controller.scrollTo(controller.contactKey)),
    ];

    return Positioned(
      top: 0, left: 0, right: 0,
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xEB0A0A0F),
          border: Border(bottom: BorderSide(color: AppColors.border)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShaderMask(
              shaderCallback: (b) => AppColors.accentGradient.createShader(b),
              child: const Text('MK.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
            ),
            if (!isMobile)
              Row(children: items.map((e) => _NavLink(item: e)).toList()),
            if (isMobile)
              PopupMenuButton<int>(
                color: AppColors.bgCard,
                icon: const Icon(Icons.menu, color: AppColors.textMuted),
                onSelected: (i) => items[i].onTap(),
                itemBuilder: (_) => items.asMap().entries.map((e) =>
                    PopupMenuItem(value: e.key,
                        child: Text(e.value.label,
                            style: const TextStyle(color: AppColors.textPrimary)))).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final VoidCallback onTap;
  _NavItem(this.label, this.onTap);
}

class _NavLink extends StatefulWidget {
  final _NavItem item;
  const _NavLink({required this.item});
  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.item.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(widget.item.label,
                style: TextStyle(fontSize: 13,
                    color: _hovered ? AppColors.textPrimary : AppColors.textMuted)),
          ),
        ),
      );
}
