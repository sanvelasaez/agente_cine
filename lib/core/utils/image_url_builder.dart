import 'package:agente_cine/config/constants/api_constants.dart';

/// Utility class to build TMDB image URLs
class ImageUrlBuilder {
  ImageUrlBuilder._();

  /// Build complete image URL from path and size
  ///
  /// Sizes available:
  /// - Poster: w92, w154, w185, w342, w500, w780, original
  /// - Backdrop: w300, w780, w1280, original
  /// - Profile: w45, w185, h632, original
  static String buildImageUrl(
    String? path, {
    ImageSize size = ImageSize.w500,
  }) {
    if (path == null || path.isEmpty) {
      return _getPlaceholderUrl(size);
    }

    return '${ApiConstants.imageBaseUrl}${size.value}$path';
  }

  /// Get poster URL
  static String poster(String? path, {PosterSize size = PosterSize.w500}) {
    return buildImageUrl(path, size: size);
  }

  /// Get backdrop URL
  static String backdrop(String? path, {BackdropSize size = BackdropSize.w780}) {
    return buildImageUrl(path, size: size);
  }

  /// Get profile URL
  static String profile(String? path, {ProfileSize size = ProfileSize.w185}) {
    return buildImageUrl(path, size: size);
  }

  static String _getPlaceholderUrl(ImageSize size) {
    // Return a placeholder image URL or empty string
    return '';
  }
}

/// Base image size
abstract class ImageSize {
  const ImageSize(this.value);
  final String value;
}

/// Poster image sizes
enum PosterSize implements ImageSize {
  w92('w92'),
  w154('w154'),
  w185('w185'),
  w342('w342'),
  w500('w500'),
  w780('w780'),
  original('original');

  const PosterSize(this.value);

  @override
  final String value;
}

/// Backdrop image sizes
enum BackdropSize implements ImageSize {
  w300('w300'),
  w780('w780'),
  w1280('w1280'),
  original('original');

  const BackdropSize(this.value);

  @override
  final String value;
}

/// Profile image sizes
enum ProfileSize implements ImageSize {
  w45('w45'),
  w185('w185'),
  h632('h632'),
  original('original');

  const ProfileSize(this.value);

  @override
  final String value;
}
