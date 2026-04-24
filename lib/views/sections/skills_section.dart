import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../controllers/skills_controller.dart';
import '../../constants/app_colors.dart';
import '../../widgets/shared_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<SkillsController>();
    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) ctrl.animate();
      },
      child: SectionWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(label: 'Skills'),
            LayoutBuilder(builder: (_, constraints) {
              final cols = constraints.maxWidth > 600 ? 4 : 2;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.55,
                ),
                itemCount: ctrl.skills.length,
                itemBuilder: (_, i) => _SkillCard(index: i),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final int index;
  const _SkillCard({required this.index});
  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<SkillsController>();
    final skill = ctrl.skills[widget.index];

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(12),

          // 🔥 Hover Border Effect
          border: Border.all(
            color: _hovered ? skill.color : AppColors.border,
            width: 1.2,
          ),

          // 🔥 Soft Glow Effect
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: skill.color.withOpacity(0.25),
              blurRadius: 12,
              spreadRadius: 1,
            )
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 ICON WITH BACKGROUND
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: skill.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                skill.icon,
                color: skill.color, // ✅ dynamic color
                size: 22,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              skill.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),

            Text(
              skill.level,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.textMuted,
              ),
            ),

            const Spacer(),

            // 🔥 Animated Progress Bar with Skill Color
            Obx(() => TweenAnimationBuilder<double>(
              tween: Tween(
                begin: 0,
                end: ctrl.animatedValues[widget.index],
              ),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              builder: (_, v, __) => ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: LinearProgressIndicator(
                  value: v,
                  minHeight: 4,
                  backgroundColor: Colors.white12,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    skill.color, // ✅ dynamic color
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
