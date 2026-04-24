import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  const SectionHeader({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(),
            style: const TextStyle(
                fontSize: 11, color: AppColors.accent,
                fontWeight: FontWeight.w600, letterSpacing: 2)),
        const SizedBox(height: 8),
        Container(
            width: 40, height: 3,
            decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(2))),
        const SizedBox(height: 28),
      ],
    );
  }
}

class SectionWrapper extends StatelessWidget {
  final Widget child;
  const SectionWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = ((w - 1100) / 2).clamp(24.0, 80.0);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h, vertical: 48),
      child: child,
    );
  }
}

class HoverCard extends StatefulWidget {
  final Widget child;
  final Color? hoverBorderColor;
  final double borderRadius;
  final Color? bgColor;
  final bool translateOnHover;

  const HoverCard({
    super.key,
    required this.child,
    this.hoverBorderColor,
    this.borderRadius = 10,
    this.bgColor,
    this.translateOnHover = false,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: widget.translateOnHover
            ? Matrix4.translationValues(0, _hovered ? -3 : 0, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: widget.bgColor ?? AppColors.bgCard,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: _hovered
                ? (widget.hoverBorderColor ?? AppColors.accent)
                : AppColors.border,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final double? width;
  const PrimaryButton({super.key, required this.label, required this.onTap, this.width});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
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
          width: widget.width,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.accent2 : AppColors.accent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(widget.label, textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
        ),
      ),
    );
  }
}

class OutlineButton2 extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const OutlineButton2({super.key, required this.label, required this.onTap});

  @override
  State<OutlineButton2> createState() => _OutlineButton2State();
}

class _OutlineButton2State extends State<OutlineButton2> {
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _hovered ? AppColors.accent : AppColors.border),
          ),
          child: Text(widget.label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimary)),
        ),
      ),
    );
  }
}
