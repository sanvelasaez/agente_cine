import 'package:agente_cine/config/database/app_database.dart';
import 'package:agente_cine/core/network/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio => DioFactory.create();

  @lazySingleton
  AppDatabase get database => AppDatabase();
}
