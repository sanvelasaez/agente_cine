import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agente_cine/config/di/injection.dart';
import 'package:agente_cine/domain/entities/genre.dart';
import 'package:agente_cine/domain/usecases/get_genres.dart';

/// Provider for genres list
final genresProvider =
    FutureProvider.autoDispose<List<Genre>>((ref) async {
  final getGenres = getIt<GetGenres>();
  final result = await getGenres();

  return result.fold(
    (failure) => throw Exception(failure.message),
    (genres) => genres,
  );
});
