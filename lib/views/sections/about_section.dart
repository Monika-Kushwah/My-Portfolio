import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/shared_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: 'About'),
          isMobile
              ? Column(children: [_Avatar(), const SizedBox(height: 24), _AboutText()])
              : Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  _Avatar(),
                  const SizedBox(width: 48),
                  Expanded(child: _AboutText()),
                ]),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
            colors: [AppColors.accent, Color(0xFFC084FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        border: Border.all(color: AppColors.accent2, width: 2),
      ),
      child: const Center(
        child: Text(
          'MK',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "I'm a Flutter Developer and Release Manager at Ubitech Solutions with 4+ years of hands-on experience building enterprise-grade cross-platform mobile applications.",
          style: TextStyle(fontSize: 14, color: AppColors.textMuted, height: 1.85),
        ),
        const SizedBox(height: 10),
        const Text(
          "I specialise in Flutter architecture, GetX state management, REST API integration, and Firebase. I handle end-to-end delivery — from development to Play Store and App Store releases.",
          style: TextStyle(fontSize: 14, color: AppColors.textMuted, height: 1.85),
        ),
        const SizedBox(height: 10),
        const Text(
          "My apps feature biometric authentication, GPS tracking, face recognition, and document uploads — deployed for real enterprise users at scale.",
          style: TextStyle(fontSize: 14, color: AppColors.textMuted, height: 1.85),
        ),
        const SizedBox(height: 20),
        Row(children: const [
          _StatCard(
            number: 4,
            suffix: '+',
            label: 'Years Exp.',
            icon: Icons.work_outline,
            color: Colors.blue,
          ),
          SizedBox(width: 12),
          _StatCard(
            number: 6,
            suffix: '+',
            label: 'Published Apps',
            icon: Icons.apps,
            color: Colors.green,
          ),
          SizedBox(width: 12),
          _StatCard(
            number: 2,
            suffix: '',
            label: 'Stores',
            icon: Icons.storefront,
            color: Colors.purple,
          ),
        ]),
      ],
    );
  }
}

class _StatCard extends StatefulWidget {
  final int number;
  final String suffix;
  final String label;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.number,
    required this.suffix,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _count;

  bool _hovered = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _count = IntTween(begin: 0, end: widget.number).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward(); // start animation
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered ? widget.color : AppColors.border,
            ),
            boxShadow: _hovered
                ? [
              BoxShadow(
                color: widget.color.withOpacity(0.25),
                blurRadius: 12,
              )
            ]
                : [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 🎨 ICON
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  widget.icon,
                  size: 18,
                  color: widget.color,
                ),
              ),

              const SizedBox(height: 8),

              // 🔢 Animated Number
              AnimatedBuilder(
                animation: _count,
                builder: (_, __) {
                  return Text(
                    '${_count.value}${widget.suffix}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: widget.color,
                    ),
                  );
                },
              ),

              const SizedBox(height: 2),

              Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
