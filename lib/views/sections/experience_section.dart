import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/experience_controller.dart';
import '../../constants/app_colors.dart';
import '../../widgets/shared_widgets.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ExperienceController>();
    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: 'Experience'),
          const _CompanyBadge(),
          const SizedBox(height: 24),
          ...ctrl.experiences.asMap().entries.map((entry) {
            final i = entry.key;
            final exp = entry.value;
            final isLast = i == ctrl.experiences.length - 1;
            return _TimelineItem(exp: exp, isLast: isLast);
          }),
        ],
      ),
    );
  }
}

class _CompanyBadge extends StatelessWidget {
  const _CompanyBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.business_outlined, size: 14, color: AppColors.accent2),
        SizedBox(width: 8),
        Text(
          'Ubitech Solutions Pvt Ltd',
          style: TextStyle(fontSize: 13, color: AppColors.accent2, fontWeight: FontWeight.w500),
        ),
      ]),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  final ExperienceModel exp;
  final bool isLast;
  const _TimelineItem({required this.exp, required this.isLast});

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _expanded = widget.exp.isCurrent;
  }

  IconData _roleIcon(String role) {
    if (role.contains('Intern')) return Icons.school_outlined;
    if (role.contains('Junior')) return Icons.code_outlined;
    if (role.contains('Senior')) return Icons.star_outline;
    if (role.contains('Release') || role.contains('Lead')) return Icons.rocket_launch_outlined;
    return Icons.developer_mode_outlined;
  }

  @override
  Widget build(BuildContext context) {
    final exp = widget.exp;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline dot + line
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: exp.isCurrent ? 16 : 13,
                  height: exp.isCurrent ? 16 : 13,
                  decoration: BoxDecoration(
                    color: exp.isCurrent ? AppColors.accent : AppColors.bgCard,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.accent, width: exp.isCurrent ? 0 : 2),
                  ),
                  child: exp.isCurrent
                      ? const Icon(Icons.circle, size: 6, color: Colors.white)
                      : null,
                ),
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: AppColors.border,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Period + current badge
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: exp.isCurrent
                              ? AppColors.accent.withOpacity(0.2)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: exp.isCurrent ? AppColors.accent : AppColors.border,
                          ),
                        ),
                        child: Text(
                          exp.period,
                          style: TextStyle(
                            fontSize: 11,
                            color: exp.isCurrent ? AppColors.accent : AppColors.textMuted,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      if (exp.isCurrent) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.green.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.green.withOpacity(0.4)),
                          ),
                          child: const Text(
                            'Current',
                            style: TextStyle(fontSize: 10, color: AppColors.green, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Role with icon
                  Row(
                    children: [
                      Icon(_roleIcon(exp.role), size: 16, color: AppColors.accent2),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          exp.role,
                          style: TextStyle(
                            fontSize: exp.isCurrent ? 16 : 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Expand/collapse toggle
                  GestureDetector(
                    onTap: () => setState(() => _expanded = !_expanded),
                    child: Row(
                      children: [
                        Text(
                          _expanded ? 'Hide details' : 'Show details',
                          style: const TextStyle(fontSize: 12, color: AppColors.accent),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          size: 14,
                          color: AppColors.accent,
                        ),
                      ],
                    ),
                  ),
                  if (_expanded) ...[
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.bgCard,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: exp.points.map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.arrow_forward, size: 12, color: AppColors.accent),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(p,
                                    style: const TextStyle(
                                        fontSize: 13, color: AppColors.textMuted, height: 1.7)),
                              ),
                            ],
                          ),
                        )).toList(),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
