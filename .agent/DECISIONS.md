# DECISIONS.md — Registro de decisiones técnicas

## DEC-002 — Uso de BLoC vs Riverpod por feature
- **Fecha:** 2026-03-11
- **Agente:** orchestrator
- **Decisión:**
  - **BLoC/Cubit:** HomePage (múltiples listas en paralelo), MovieDetailPage (múltiples estados de carga), SearchDelegate (debounce, paginación)
  - **Riverpod:** FavoritesPage (estado simple de lista + toggle), CategoriesPage (filtro estático), providers de configuración y caché
- **Impacto:** `presentation/screens/*/bloc/` o `presentation/screens/*/providers/` según la feature

## DEC-003 — Estrategia de caché local con Drift
- **Fecha:** 2026-03-11
- **Agente:** orchestrator
- **Decisión:**
  - Tabla `favorites`: id (autoincrement), movieId (int, unique), addedAt (DateTime)
  - Estrategia: Solo favoritos persisten localmente, listas se obtienen siempre de TMDB (remote-first)
- **Impacto:** `config/database/tables/favorites_table.dart`, `config/database/daos/favorites_dao.dart`, `infrastructure/repositories/favorites_repository_impl.dart`

## DEC-006 — Dio puro en lugar de Retrofit
- **Fecha:** 2026-03-11
- **Agente:** domain-infra-agent
- **Decisión:** Usar Dio directamente en TmdbRemoteDataSource sin capa Retrofit
- **Razón:** Retrofit requiere build_runner para generar código boilerplate. Dio puro es más directo y suficiente para TMDB v3
- **Impacto:** `infrastructure/datasources/remote/tmdb_remote_datasource.dart`

## DEC-009 — Web no soportado
- **Fecha:** 2026-03-11
- **Agente:** qa-agent
- **Decisión:** Documentar explícitamente que web NO está soportado debido a dependencia de Drift/sqlite3/FFI
- **Impacto:** README.md y pubspec.yaml

## DEC-010 — Sistema de comandos make multiplataforma
- **Fecha:** 2026-03-19
- **Agente:** orchestrator
- **Decisión:** Tres opciones de ejecución de comandos disponibles:
  - `Makefile` (GNU make): Detecta automáticamente el SO y usa fvm.bat en Windows, fvm en Linux/Mac
  - `make.sh`: Script bash nativo para Git Bash, Linux, Mac
  - `make.bat`: Script batch para Windows CMD/PowerShell
- **Razón:** Máxima compatibilidad entre entornos de desarrollo (Windows, Linux, Mac) sin depender de herramientas externas específicas de un SO
- **Impacto:** Raíz del proyecto (Makefile, make.sh, make.bat), documentado en CLAUDE.project.md
