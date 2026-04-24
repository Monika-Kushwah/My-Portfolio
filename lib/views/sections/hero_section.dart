import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../controllers/nav_controller.dart';
import '../../constants/app_colors.dart';
import '../../widgets/shared_widgets.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});
  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _ctrl.forward();
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    final isMobile = MediaQuery.of(context).size.width < 700;
    return FadeTransition(
      opacity: _fade,
      child: SectionWrapper(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BadgeChip(),
              const SizedBox(height: 20),
              ShaderMask(
                shaderCallback: (b) => AppColors.accentGradient.createShader(b),
                child: Text('Monika Kushwah',
                    style: TextStyle(
                        fontSize: isMobile ? 32 : 48,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.15)),
              ),
              const SizedBox(height: 8),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Flutter Developer & Release Manager',
                    textStyle: TextStyle(
                        fontSize: isMobile ? 15 : 20,
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w400),
                    speed: const Duration(milliseconds: 55),
                  ),
                ],
                totalRepeatCount: 1,
              ),
              const SizedBox(height: 8),
              Row(children: const [
                Icon(Icons.location_on_outlined, size: 13, color: AppColors.textMuted),
                SizedBox(width: 4),
                Text('Gwalior, Madhya Pradesh, India',
                    style: TextStyle(fontSize: 13, color: AppColors.textMuted)),
              ]),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: const Text(
                  'Flutter Developer with 4+ years of experience building cross-platform mobile apps. Skilled in Flutter architecture, GetX, REST APIs, Firebase, and end-to-end Play Store & App Store deployments.',
                  style: TextStyle(fontSize: 15, color: AppColors.textMuted, height: 1.85),
                ),
              ),
              const SizedBox(height: 28),
              Wrap(spacing: 12, runSpacing: 12, children: [
                PrimaryButton(label: 'View My Work', onTap: () => nav.scrollTo(nav.projectsKey)),
                OutlineButton2(label: 'Contact Me', onTap: () => nav.scrollTo(nav.contactKey)),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class _BadgeChip extends StatefulWidget {
  @override
  State<_BadgeChip> createState() => _BadgeChipState();
}

class _BadgeChipState extends State<_BadgeChip> with SingleTickerProviderStateMixin {
  late AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(vsync: this,
        duration: const Duration(seconds: 2), lowerBound: 0.4, upperBound: 1.0)
      ..repeat(reverse: true);
  }

  @override
  void dispose() { _pulse.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.accent.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          AnimatedBuilder(
            animation: _pulse,
            builder: (_, __) => Opacity(
              opacity: _pulse.value,
              child: Container(width: 7, height: 7,
                  decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle)),
            ),
          ),
          const SizedBox(width: 8),
          const Text('Open to opportunities',
              style: TextStyle(fontSize: 12, color: AppColors.accent2)),
        ]),
      );
}
