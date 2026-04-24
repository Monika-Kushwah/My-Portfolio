import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle sectionLabel = TextStyle(
    fontSize: 11, color: AppColors.accent,
    fontWeight: FontWeight.w600, letterSpacing: 2,
  );
  static const TextStyle heading = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14, color: AppColors.textMuted, height: 1.85,
  );
  static const TextStyle small = TextStyle(
    fontSize: 12, color: AppColors.textMuted,
  );
  static const TextStyle cardTitle = TextStyle(
    fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
  );
}
