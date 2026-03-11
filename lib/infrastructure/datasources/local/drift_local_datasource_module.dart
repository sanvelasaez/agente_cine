import 'package:agente_cine/config/database/app_database.dart';
import 'package:agente_cine/infrastructure/datasources/local/drift_local_datasource.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DriftLocalDataSourceModule {
  @lazySingleton
  DriftLocalDataSource driftLocalDataSource(AppDatabase database) =>
      DriftLocalDataSource(database);
}
