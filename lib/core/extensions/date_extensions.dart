import 'package:intl/intl.dart';

/// Extension methods for DateTime
extension DateTimeExtensions on DateTime {
  /// Format as 'dd/MM/yyyy'
  String toFormattedDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  /// Format as 'dd MMM yyyy' (e.g., '15 Mar 2024')
  String toShortDate() {
    return DateFormat('dd MMM yyyy').format(this);
  }

  /// Format as 'MMMM dd, yyyy' (e.g., 'March 15, 2024')
  String toLongDate() {
    return DateFormat('MMMM dd, yyyy').format(this);
  }

  /// Format as year only
  String toYear() {
    return DateFormat('yyyy').format(this);
  }

  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is in the past
  bool get isPast {
    return isBefore(DateTime.now());
  }

  /// Check if date is in the future
  bool get isFuture {
    return isAfter(DateTime.now());
  }

  /// Get time ago string (e.g., '2 days ago')
  String toTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'just now';
    }
  }
}

/// Extension methods for nullable DateTime
extension NullableDateTimeExtensions on DateTime? {
  /// Format or return default
  String toFormattedDateOrDefault([String defaultValue = 'N/A']) {
    return this?.toFormattedDate() ?? defaultValue;
  }

  /// Get year or null
  String? toYearOrNull() {
    return this?.toYear();
  }
}
