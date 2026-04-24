import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/projects_controller.dart';
import '../../constants/app_colors.dart';
import '../../widgets/shared_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ProjectsController>();
    final isMobile = MediaQuery.of(context).size.width < 700;

    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: 'Projects'),

          isMobile
              ? Column(
            children: ctrl.projects
                .map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _ProjectCard(project: p),
            ))
                .toList(),
          )
              : Row(
            children: ctrl.projects
                .map((p) => Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8),
                child: _ProjectCard(project: p),
              ),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectModel project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ProjectsController>();

    return HoverCard(
      translateOnHover: true,
      borderRadius: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 Banner with colorful glowing icon
          Container(
            height: 110,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: project.bannerColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: project.iconColor.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Icon(
                  project.icon,
                  size: 32,
                  color: project.iconColor, // ✅ dynamic color
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.tags.map((t) => _Tag(t)).toList(),
                ),

                const SizedBox(height: 10),

                Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  project.desc,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textMuted,
                    height: 1.65,
                  ),
                ),

                const SizedBox(height: 14),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _StoreBtn(
                      label: 'Play Store',
                      icon: Icons.android,
                      onTap: () =>
                          ctrl.launchUrlExternal(project.playUrl),
                    ),
                    _StoreBtn(
                      label: 'App Store',
                      icon: Icons.apple,
                      onTap: () =>
                          ctrl.launchUrlExternal(project.appUrl),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  const _Tag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          color: AppColors.accent2,
        ),
      ),
    );
  }
}

class _StoreBtn extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _StoreBtn({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_StoreBtn> createState() => _StoreBtnState();
}

class _StoreBtnState extends State<_StoreBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.accent
                : AppColors.accent.withOpacity(0.12),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: _hovered ? AppColors.accent : AppColors.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 12,
                color: _hovered ? Colors.white : AppColors.accent2,
              ),
              const SizedBox(width: 5),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 11,
                  color: _hovered ? Colors.white : AppColors.accent2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}