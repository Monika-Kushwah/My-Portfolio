import 'package:flutter/material.dart';

class AppColors {
  static const Color bg          = Color(0xFF0A0A0F);
  static const Color bgCard      = Color(0xFF141420);
  static const Color accent      = Color(0xFF7C6EF5);
  static const Color accent2     = Color(0xFFA78BFA);
  static const Color textPrimary = Color(0xFFF0EEFF);
  static const Color textMuted   = Color(0xFF8B89A8);
  static const Color border      = Color(0x337C6EF5);
  static const Color green       = Color(0xFF4ADE80);

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent2, Color(0xFFC084FC), Color(0xFF818CF8)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
