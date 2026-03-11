# DECISIONS.md — Registro de decisiones técnicas

## DEC-002 — Uso de BLoC vs Riverpod por feature
- **Fecha:** 2026-03-11
- **Agente:** orchestrator
- **Contexto:** CLAUDE.md permite elegir entre BLoC y Riverpod según complejidad del flujo
- **Decisión:**
  - **BLoC/Cubit:** HomePage (múltiples listas en paralelo), MovieDetailPage (múltiples estados de carga), SearchDelegate (debounce, paginación)
  - **Riverpod:** FavoritesPage (estado simple de lista + toggle), CategoriesPage (filtro estático), providers de configuración y caché
- **Alternativas descartadas:**
  - Usar solo BLoC en todo: overhead innecesario en páginas simples
  - Usar solo Riverpod: dificulta testing de flujos complejos como búsqueda
- **Impacto:** `presentation/features/*/bloc/` o `presentation/features/*/providers/` según la feature

## DEC-003 — Estrategia de caché local con Drift
- **Fecha:** 2026-03-11
- **Agente:** orchestrator
- **Contexto:** Favoritos deben persistir offline
- **Decisión:**
  - Tabla `favorites`: id (autoincrement), movieId (int, unique), addedAt (DateTime)
  - Estrategia: Solo favoritos persisten localmente, listas se obtienen siempre de TMDB (remote-first)
- **Alternativas descartadas:**
  - Cachear listas de películas: complejidad innecesaria para Fase 1
  - SharedPreferences para favoritos: límite de tamaño, no relacional
- **Impacto:** `config/database/tables/favorites_table.dart`, `config/database/daos/favorites_dao.dart`, `infrastructure/repositories/favorites_repository_impl.dart`

## DEC-006 — Dio puro en lugar de Retrofit
- **Fecha:** 2026-03-11
- **Agente:** domain-infra-agent
- **Contexto:** CLAUDE.md especifica retrofit, pero el proyecto necesitaba avanzar rápido
- **Decisión:** Usar Dio directamente en TmdbRemoteDataSource sin capa Retrofit
- **Razón:** Retrofit requiere build_runner para generar código boilerplate. Dio puro es más directo y suficiente para TMDB v3
- **Alternativas descartadas:**
  - Retrofit: añade complejidad de generación de código sin beneficio claro para este caso
- **Impacto:** `infrastructure/datasources/remote/tmdb_remote_datasource.dart`

## DEC-007 — Navegación directa a páginas reales desde HomePage
- **Fecha:** 2026-03-11
- **Agente:** presentation-agent (fix/router-real-pages)
- **Contexto:** HomePage inicialmente solo mostraba listas sin navegación funcional
- **Decisión:**
  - MovieCard navega a `/movie/:id` (MovieDetailPage) al hacer tap
  - AppBar de HomePage tiene IconButton de búsqueda que invoca MovieSearchDelegate
  - AppBar tiene Drawer con navegación a Favorites y Categories
- **Impacto:** `presentation/features/home/pages/home_page.dart`, `config/router/app_router.dart`

## DEC-008 — SearchDelegate sin inyección de dependencias
- **Fecha:** 2026-03-11
- **Agente:** test-agent (fix/search-delegate-di)
- **Contexto:** MovieSearchDelegate necesitaba acceso a SearchMoviesUseCase pero SearchDelegate de Flutter no soporta DI estándar
- **Decisión:** Pasar SearchMoviesUseCase como parámetro en el constructor de MovieSearchDelegate
- **Alternativas descartadas:**
  - GetIt.instance.get() dentro del delegate: acoplamiento global
  - BuildContext.read() de Riverpod: SearchDelegate no tiene acceso continuo a BuildContext
- **Impacto:** `presentation/delegates/movie_search_delegate.dart`, llamadas desde HomePage

## DEC-009 — Web no soportado
- **Fecha:** 2026-03-11
- **Agente:** qa-agent
- **Contexto:** Flutter permite compilar a web, pero Drift usa sqlite3 con FFI que no funciona en web
- **Decisión:** Documentar explícitamente que web NO está soportado debido a dependencia de Drift/sqlite3/FFI
- **Impacto:** Añadida nota en README.md y comentarios en pubspec.yaml
