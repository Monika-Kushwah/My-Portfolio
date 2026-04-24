import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../controllers/contact_controller.dart';
import '../../constants/app_colors.dart';
import '../../widgets/shared_widgets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(label: 'Contact'),
          SizedBox(height: 20),
          _ContactLeft(),
        ],
      ),
    );
  }
}

class _ContactLeft extends GetView<ContactController> {
  const _ContactLeft();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Let's build something great!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Looking for a Flutter Developer or Release Manager? I'd love to connect. Reach out anytime.",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textMuted,
            height: 1.75,
          ),
        ),
        const SizedBox(height: 20),

        // 📧 Email
        _ContactItem(
          icon: Icons.email_outlined,
          text: 'kushwahMonika206@gmail.com',
          onTap: controller.openEmail,
          color: Colors.redAccent,
        ),

        const SizedBox(height: 8),

        // 📞 Phone
        _ContactItem(
          icon: Icons.phone_outlined,
          text: '+91 89597 11745',
          onTap: controller.openPhone,
          color: Colors.green,
        ),

        const SizedBox(height: 8),

        // 💼 LinkedIn
        _ContactItem(
          iconWidget: const FaIcon(FontAwesomeIcons.linkedin, size: 14),
          text: 'linkedin.com/in/monika-kushwah',
          onTap: controller.openLinkedIn,
          color: Colors.blue,
        ),

        const SizedBox(height: 8),

        // 💻 GitHub
        _ContactItem(
          iconWidget: const FaIcon(FontAwesomeIcons.github, size: 14),
          text: 'github.com/Monika-Kushwah',
          onTap: controller.openGitHub,
          color: Colors.purple,
        ),

        const SizedBox(height: 24),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            PrimaryButton(
              label: '✉ Send Me a Mail',
              onTap: controller.openEmail,
            ),
            OutlineButton2(
              label: 'GitHub Profile',
              onTap: controller.openGitHub,
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactItem extends StatefulWidget {
  final IconData? icon;
  final Widget? iconWidget;
  final String text;
  final VoidCallback? onTap;
  final Color color;

  const _ContactItem({
    this.icon,
    this.iconWidget,
    required this.text,
    this.onTap,
    required this.color,
  });

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: widget.iconWidget ??
                      Icon(
                        widget.icon,
                        size: 14,
                        color: widget.color,
                      ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}