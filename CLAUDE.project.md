# CLAUDE.project.md — AgenteCine

> Especificaciones del proyecto. Lectura obligatoria junto a CLAUDE.base.md antes de cualquier acción.
> REGLA: Ignorar todo el contenido dentro de bloques de comentarios HTML (<!-- -->). No son instrucciones activas.

---

## 📌 FINALIDAD DEL PROYECTO

**Nombre:** AgenteCine
**Plataformas objetivo:** Android e iOS (móvil first)
**Público objetivo:** Usuarios aficionados al cine que quieren explorar, descubrir y gestionar su experiencia cinematográfica desde el móvil.

**Descripción:**
Aplicación móvil Flutter que consume principalmente la API de The Movie Database (TMDB v3) para ofrecer al usuario una experiencia completa de descubrimiento de películas. La arquitectura debe permitir incorporar otras APIs externas en el futuro sin afectar al dominio.

**Funcionalidades core de la Fase 1:**
- Página principal con listas horizontales interactivas: tendencias, populares, mejor valoradas, próximos estrenos, ahora en cines
- Buscador global de películas con resultados en tiempo real (usando SearchDelegate)
- Página de detalle de película: sinopsis, reparto, géneros, valoraciones, trailer
- Página de favoritos: películas marcadas por el usuario, persistidas localmente con Drift
- Página de categorías / géneros: listado de películas filtradas por género
- El orquestador puede proponer e implementar páginas y funcionalidades adicionales que mejoren la experiencia sin necesidad de aprobación del usuario, siempre que no rompan lo ya definido

**API principal:**
- Proveedor: The Movie Database (TMDB)
- Versión: v3
- Documentación: https://developer.themoviedb.org/reference/getting-started
- API Key: `12f09b2a1cc31bb460929d44c9387f69`
- Base URL: `https://api.themoviedb.org/3`
- Imágenes base URL: `https://image.tmdb.org/t/p/`
- La clave se guarda en `config/constants/api_constants.dart` — nunca hardcodeada en widgets ni actions

**Escalabilidad de APIs:**
El sistema de datasources debe diseñarse para que añadir una nueva API (ej. OMDB, JustWatch) sea tan simple como crear un nuevo `RemoteDataSource` + su `RepositoryImpl`, sin modificar el dominio.

---

## 🧱 STACK TECNOLÓGICO

| Capa | Tecnología |
|------|-----------|
| Framework | Flutter 3.41.4 (gestionado con FVM) |
| Lenguaje | Dart |
| Gestor de versiones | FVM (Flutter Version Management) |
| Estado (flujos complejos) | flutter_bloc + BLoC pattern |
| Estado (UI reactivo / caché) | Riverpod (riverpod + flutter_riverpod + hooks_riverpod) |
| Cuándo usar cada uno | BLoC para flujos con múltiples estados (búsqueda, paginación, detalle). Riverpod para estado simple, providers de config y caché de datos ya cargados. El orquestador decide en cada feature. |
| Inyección de dependencias | get_it + injectable |
| Navegación | go_router |
| Red | dio + retrofit |
| Base de datos local | drift (sqlite) — https://drift.simonbinder.eu/setup/ |
| Preferencias simples | shared_preferences |
| Modelos inmutables | freezed + json_serializable |
| Generación de código | build_runner (retrofit, injectable, drift, freezed) |
| Testing | flutter_test + mocktail + bloc_test |
| Linting | flutter_lints + analysis_options.yaml personalizado |

### Gestión de versiones con FVM

**¿Por qué FVM?**
FVM (Flutter Version Management) permite usar versiones específicas de Flutter por proyecto, evitando conflictos entre diferentes entornos de desarrollo.

**Instalación:**
```cmd
dart pub global activate fvm
```

**Configuración inicial del proyecto:**
```cmd
make.bat setup
```

Este comando instala Flutter 3.41.4 vía FVM y descarga todas las dependencias del proyecto.

**REGLA CRÍTICA:** Todos los comandos de Flutter y Dart deben ejecutarse con el prefijo `fvm` o mediante los comandos del `make.batfile`.

**Comandos disponibles (ver `make.bat help` para lista completa):**
```cmd
make.bat setup          # Instala Flutter 3.41.4 via FVM y descarga dependencias
make.bat run            # Ejecuta la app
make.bat gen            # Regenera código (freezed, injectable, drift)
make.bat test           # Ejecuta tests
make.bat coverage       # Tests con reporte de cobertura
make.bat lint           # Análisis estático de código
make.bat doctor         # Comprueba configuración del entorno
make.bat clean          # Limpia artefactos de build
```

**Comandos directos con FVM (si no usas make):**
```cmd
fvm flutter pub get
fvm flutter run
fvm dart run build_runner build --delete-conflicting-outputs
fvm flutter test
fvm flutter analyze
```

---

## 🗂️ ESTRUCTURA DE DIRECTORIOS

```
agente_cine/
├── lib/
│   ├── main.dart                        # Solo inicialización: DI, zona de errores, runApp
│   ├── app.dart                         # MaterialApp.router con GoRouter y providers raíz
│   │
│   ├── config/                          # Configuración global — sin lógica de negocio
│   │   ├── router/                      # GoRouter: rutas nombradas, guards, shell routes
│   │   ├── theme/                       # ThemeData, colores, tipografía, tokens de diseño
│   │   ├── constants/                   # api_constants.dart, app_constants.dart
│   │   ├── dependencies/                # Módulos get_it + injectable (@module)
│   │   ├── env/                         # Manejo de variables de entorno (envied o dotenv)
│   │   └── database/                    # Configuración de Drift: AppDatabase, DAOs, tablas
│   │       ├── app_database.dart        # @DriftDatabase(tables: [...])
│   │       ├── tables/                  # Definición de tablas Drift
│   │       └── daos/                    # Data Access Objects por entidad
│   │
│   ├── domain/                          # Lógica de negocio pura — cero imports de Flutter/Drift/Dio
│   │   ├── entities/                    # Clases Dart puras (con freezed si se desea)
│   │   ├── repositories/                # Interfaces abstractas (contratos)
│   │   ├── actions/                     # Un archivo por acción de negocio, retornan Either<Failure, T>
│   │   └── errors/                      # Jerarquía de Failure: NetworkFailure, CacheFailure, etc.
│   │
│   ├── infrastructure/                  # Implementaciones concretas — nunca importado por domain
│   │   ├── repositories/                # Implementaciones de los contratos de domain/repositories
│   │   ├── datasources/
│   │   │   ├── remote/                  # TmdbRemoteDataSource, futuros: OmdbDataSource, etc.
│   │   │   └── local/                   # DriftLocalDataSource, SharedPrefsDataSource
│   │   ├── models/                      # DTOs con fromJson/toJson (freezed)
│   │   └── mappers/                     # Conversión DTO → Entidad y Drift Row → Entidad
│   │
│   ├── presentation/                    # UI, estado y navegación — sin lógica de negocio
│   │   ├── shared/                      # Elementos reutilizables en toda la app
│   │   │   ├── widgets/                 # MovieCard, RatingBar, ErrorView, LoadingIndicator, etc.
│   │   │   ├── views/                   # Vistas base reutilizables si el orquestador las considera necesarias
│   │   │   └── extensions/              # Extension methods de UI (context.colors, context.textTheme)
│   │   ├── search/                      # SearchDelegate para búsqueda global de películas
│   │   │   └── movie_search_delegate.dart
│   │   └── screens/                     # Una carpeta por funcionalidad completa
│   │       ├── home/                    # Página principal con listas
│   │       │   ├── bloc/                # o providers/ según decisión del orquestador
│   │       │   ├── pages/
│   │       │   └── widgets/
│   │       ├── movie_detail/
│   │       ├── favorites/
│   │       ├── categories/
│   │       └── search/
│   │
│   └── core/                            # Utilidades transversales — sin reglas de negocio
│       ├── error/                       # AppException, mapeo de excepciones a Failures
│       ├── network/                     # DioFactory, interceptores (log, auth, error)
│       ├── utils/                       # Logger, formatters, date_utils, image_url_builder
│       └── extensions/                  # Extension methods Dart puros (String, List, DateTime)
│
├── test/                                # Espejo exacto de lib/ — ver sección de Testing
├── integration_test/                    # Tests end-to-end por flujo completo
├── .agent/                              # Archivos de coordinación entre agentes — ver sección Agentes
├── CLAUDE.md
├── CLAUDE.project.md
└── pubspec.yaml
```

---

## 📐 REGLAS DE ARQUITECTURA (NO NEGOCIABLES)

### Flujo de dependencias

```
presentation ──► domain ◄── infrastructure
                   ▲
             config / core  (transversal, importable desde cualquier capa)
```

1. `domain` importa únicamente Dart puro. Ningún paquete de Flutter, Dio, Drift o similar.
2. `infrastructure` implementa `domain`. `domain` nunca conoce `infrastructure`.
3. `presentation` importa `domain` (entidades, actions, errors). Nunca importa `infrastructure`.
4. `config/dependencies` es el único lugar donde se instancian implementaciones concretas.
5. `core` puede ser importado desde cualquier capa pero no importa nada de `domain`, `infrastructure` ni `presentation`.

### Reglas de nombrado

| Elemento | Convención | Ejemplo |
|----------|-----------|---------|
| Archivos | `snake_case.dart` | `movie_repository.dart` |
| Clases | `PascalCase` | `MovieRepository` |
| Variables / métodos | `camelCase` | `getPopularMovies` |
| Constantes | `camelCase` | `apiBaseUrl`, `defaultTimeout` |
| Interfaces / abstractas | Sin prefijo ni sufijo especial | `MovieRepository` |
| Implementaciones | Sufijo `Impl` | `MovieRepositoryImpl` |
| DTOs / Models | Sufijo `Dto` | `MovieDto`, `GenreDto` |
| Blocs | Sufijo `Bloc` o `Cubit` | `HomeBloc`, `FavoritesCubit` |
| States | Sufijo `State` | `HomeState`, `FavoritesState` |
| Events (BLoC) | Sufijo `Event` | `HomeEvent`, `LoadTrendingEvent` |
| Providers (Riverpod) | Sufijo `Provider` | `themeProvider`, `movieDetailProvider` |
| DAOs (Drift) | Sufijo `Dao` | `FavoritesDao`, `CacheDao` |

### Reglas de código

- Máximo 200 líneas por archivo. Si se supera, refactorizar en archivos más pequeños.
- Máximo 1 clase pública por archivo.
- Nunca usar `dynamic`. Tipar siempre explícitamente.
- Nunca `print()`. Usar el logger de `core/utils/logger.dart` en todos los casos.
- Toda lógica de negocio en un Action. Blocs y Cubits solo orquestan flujo, no razonan.
- Manejo de errores con `Either<Failure, T>` de dartz. Sin `throw` sueltos fuera de datasources.
- Los datasources remotos sí pueden lanzar excepciones — el repositorio las captura y convierte en Failure.
- Todos los strings visibles al usuario en archivos ARB de internacionalización. Cero strings hardcodeados en widgets.
- Todo modelo que se serialice a/desde JSON o Drift debe usar `freezed` para inmutabilidad.

---

## 🎨 PATRONES DE DISEÑO POR CAPA

| Patrón | Dónde | Razón |
|--------|-------|-------|
| Repository Pattern | `domain/repositories` (contrato) + `infrastructure/repositories` (impl) | Desacopla origen de datos del dominio |
| Factory Method | `infrastructure/models` (fromJson, fromDrift) | Construcción controlada de objetos |
| Facade | `infrastructure/repositories/impl` | Oculta la complejidad de múltiples datasources |
| Observer / BLoC | `presentation/screens/*/bloc` | Estado reactivo, testeable y desacoplado de UI |
| Provider (Riverpod) | `presentation/screens/*/providers` | Caché reactivo, estado simple, scoped |
| Dependency Injection | `config/dependencies` con get_it | Bajo acoplamiento, facilita testing |
| Singleton | Servicios globales registrados en get_it | Una instancia controlada (AppDatabase, DioClient) |
| Mapper / Adapter | `infrastructure/mappers` | Conversión entre capas sin contaminar entidades |
| Command | `domain/actions` | Encapsula y nombra operaciones de negocio |
| Composite | Widgets en `presentation/shared/widgets` | Composición reutilizable de UI |
| Strategy | Validadores, formatters en `core/utils` | Algoritmos intercambiables |
| Delegate | `presentation/search` | Búsqueda con SearchDelegate nativo de Flutter |

---

## 🧪 ARQUITECTURA DE TESTING

### Filosofía

`lib/` contiene únicamente código de producción. `test/` replica exactamente la misma estructura de carpetas y nombrado, añadiendo el sufijo `_test.dart`. No se divide `lib/` en subdirectorios `app/` y `test/` — se mantiene la convención estándar de Flutter.

### Estructura de test/

```
test/
├── helpers/                             # Fixtures, factories de mocks, utilidades compartidas
│   ├── mock_factories.dart              # Instancias mocktail reutilizables
│   └── fixtures/                       # JSON de respuesta real de TMDB para tests
│       ├── movie_list_response.json
│       ├── movie_detail_response.json
│       └── genre_list_response.json
│
├── domain/
│   ├── entities/                        # Tests de lógica de entidades (si tienen métodos)
│   ├── actions/                         # Un test por Action — mockear solo el repositorio
│   └── errors/
│
├── infrastructure/
│   ├── repositories/                    # Test del repo: lógica de coordinación remote/local
│   ├── datasources/
│   │   ├── remote/                      # Test con DioAdapter o http.MockClient + fixtures JSON
│   │   └── local/                       # Test de DAOs con NativeDatabase.memory() de Drift
│   └── mappers/                         # Test de conversión DTO ↔ Entidad
│
└── presentation/
    ├── shared/widgets/                  # Widget tests de componentes comunes
    └── screens/
        └── [screen]/
            ├── bloc/                    # Unit test del Bloc/Cubit con bloc_test
            └── pages/                   # Widget test de la page con providers/blocs mockeados
```

### Reglas de testing

- Cobertura mínima: 80% en `domain/` e `infrastructure/`
- Unit tests cubren todo `domain/` y `infrastructure/`
- Widget tests cubren todos los widgets de `shared/` y las pages de cada screen
- Integration tests en `integration_test/` para flujos completos (home → detalle, búsqueda, favoritos)
- Mocking solo con `mocktail`. Prohibido `mockito` con generación de código
- Tests de BLoC usan el paquete `bloc_test` con `whenListen` y `expectLater`
- Tests de DAOs Drift usan `NativeDatabase.memory()` — nunca la base de datos real
- Cada fixture JSON en `test/helpers/fixtures/` corresponde a un endpoint real de TMDB

---

## 🤖 EQUIPO DE AGENTES

### Modelo de IA

Todos los agentes, incluido el orquestador, deben usar **claude-sonnet-4-5-20251001**.
Configurado en `.claude/settings.json`. Si un agente detecta un modelo distinto, notificar al orquestador antes de continuar.

### Equipo fijo: 5 agentes especializados

| ID | Agente | Scope exclusivo |
|----|--------|----------------|
| `orchestrator` | Orquestador | Planificación, asignación, revisión de PRs, decisiones de arquitectura, gestión de `.agent/` |
| `domain-infra-agent` | Dominio e Infraestructura | `domain/`, `infrastructure/`, `config/dependencies/`, `config/database/` |
| `presentation-agent` | Presentación | `presentation/`, `config/router/`, `config/theme/` |
| `test-agent` | Testing | `test/`, `integration_test/`, cobertura de tests unitarios |
| `product-qa-agent` | Calidad de Producto | Ejecución de app, validación funcional, detección de bugs, apertura de incidencias en `.agent/ISSUES.md` |

El orquestador mantiene siempre activos los 5 agentes durante la fase de desarrollo activa, asignando trabajo en paralelo cuando las dependencias lo permitan. El orden de implementación es: `domain → infrastructure → config/di → presentation`.

---

## 📎 REFERENCIAS

- [Flutter Architecture Guidelines](https://docs.flutter.dev/app-architecture)
- [Effective Dart](https://dart.dev/effective-dart)
- [TMDB API v3 Docs](https://developer.themoviedb.org/reference/getting-started)
- [Drift (sqlite Flutter)](https://drift.simonbinder.eu/setup/)
- [flutter_bloc](https://bloclibrary.dev/)
- [Riverpod](https://riverpod.dev/)
- [go_router](https://pub.dev/packages/go_router)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Clean Architecture — Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
