import 'package:flutter/material.dart';

/// App color palette - Dark theme inspired by cinema apps
class AppColors {
  AppColors._();

  // Primary colors
  static const Color primary = Color(0xFFE50914); // Netflix red
  static const Color primaryDark = Color(0xFFB20710);
  static const Color primaryLight = Color(0xFFFF1F29);

  // Secondary colors
  static const Color secondary = Color(0xFFFFC107); // Gold/Amber
  static const Color secondaryDark = Color(0xFFFFA000);
  static const Color secondaryLight = Color(0xFFFFD54F);

  // Background colors
  static const Color background = Color(0xFF141414); // Almost black
  static const Color surface = Color(0xFF1F1F1F);
  static const Color surfaceVariant = Color(0xFF2A2A2A);

  // Text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color textDisabled = Color(0xFF808080);

  // Functional colors
  static const Color error = Color(0xFFCF6679);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA726);
  static const Color info = Color(0xFF29B6F6);

  // Rating colors
  static const Color ratingHigh = Color(0xFF4CAF50); // > 7.0
  static const Color ratingMedium = Color(0xFFFFA726); // 5.0 - 7.0
  static const Color ratingLow = Color(0xFFE57373); // < 5.0

  // Overlay colors
  static const Color overlay = Color(0x80000000); // 50% black
  static const Color overlayLight = Color(0x40000000); // 25% black

  // Divider
  static const Color divider = Color(0xFF404040);
}
