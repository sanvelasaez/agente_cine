import 'package:flutter/material.dart';

/// Extension methods for BuildContext to access theme easily
extension ContextExtensions on BuildContext {
  /// Get current theme
  ThemeData get theme => Theme.of(this);

  /// Get text theme
  TextTheme get textTheme => theme.textTheme;

  /// Get color scheme
  ColorScheme get colors => theme.colorScheme;

  /// Get media query
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get screen size
  Size get screenSize => mediaQuery.size;

  /// Get screen width
  double get screenWidth => screenSize.width;

  /// Get screen height
  double get screenHeight => screenSize.height;

  /// Check if screen is small (< 600dp)
  bool get isSmallScreen => screenWidth < 600;

  /// Check if screen is medium (600-900dp)
  bool get isMediumScreen => screenWidth >= 600 && screenWidth < 900;

  /// Check if screen is large (>= 900dp)
  bool get isLargeScreen => screenWidth >= 900;

  /// Show snack bar
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colors.error : null,
      ),
    );
  }
}
