import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';

/// Genre entity - represents a movie genre
@freezed
abstract class Genre with _$Genre {
  const factory Genre({required int id, required String name}) = _Genre;
}
