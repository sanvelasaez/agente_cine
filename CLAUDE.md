# CLAUDE.md — AgenteCine

> Este archivo define las reglas, arquitectura y comportamiento esperado para todos los agentes
> que trabajen en este proyecto. Lectura **obligatoria y completa** antes de tocar cualquier archivo.
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
- La clave se guarda en `config/constants/api_constants.dart` — nunca hardcodeada en widgets ni usecases

**Escalabilidad de APIs:**
El sistema de datasources debe diseñarse para que añadir una nueva API (ej. OMDB, JustWatch) sea tan simple como crear un nuevo `RemoteDataSource` + su `RepositoryImpl`, sin modificar el dominio.

---

## 🧱 STACK TECNOLÓGICO

| Capa | Tecnología |
|------|-----------|
| Framework | Flutter (stable channel) |
| Lenguaje | Dart |
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
│   │   ├── di/                          # Módulos get_it + injectable (@module)
│   │   ├── env/                         # Manejo de variables de entorno (envied o dotenv)
│   │   └── database/                    # Configuración de Drift: AppDatabase, DAOs, tablas
│   │       ├── app_database.dart        # @DriftDatabase(tables: [...])
│   │       ├── tables/                  # Definición de tablas Drift
│   │       └── daos/                    # Data Access Objects por entidad
│   │
│   ├── domain/                          # Lógica de negocio pura — cero imports de Flutter/Drift/Dio
│   │   ├── entities/                    # Clases Dart puras (con freezed si se desea)
│   │   ├── repositories/                # Interfaces abstractas (contratos)
│   │   ├── usecases/                    # Un archivo por caso de uso, retornan Either<Failure, T>
│   │   └── failures/                    # Jerarquía de Failure: NetworkFailure, CacheFailure, etc.
│   │
│   ├── infrastructure/                  # Implementaciones concretas — nunca importado por domain
│   │   ├── repositories/                # Implementaciones de los contratos de domain/repositories
│   │   ├── datasources/
│   │   │   ├── remote/                  # TmdbRemoteDataSource, futuros: OmdbDataSource, etc.
│   │   │   └── local/                   # DriftLocalDataSource, SharedPrefsDataSource
│   │   ├── models/                      # DTOs: MovieDto, GenreDto — con fromJson/toJson (freezed)
│   │   └── mappers/                     # Conversión DTO → Entidad y Drift Row → Entidad
│   │
│   ├── presentation/                    # UI, estado y navegación — sin lógica de negocio
│   │   ├── common/                      # Elementos reutilizables en toda la app
│   │   │   ├── widgets/                 # MovieCard, RatingBar, ErrorView, LoadingIndicator, etc.
│   │   │   ├── views/                   # Vistas base reutilizables si el orquestador las considera necesarias
│   │   │   └── extensions/              # Extension methods de UI (context.colors, context.textTheme)
│   │   ├── delegates/                   # SearchDelegate para búsqueda global de películas
│   │   │   └── movie_search_delegate.dart
│   │   └── features/                    # Una carpeta por funcionalidad completa
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
3. `presentation` importa `domain` (entidades, usecases, failures). Nunca importa `infrastructure`.
4. `config/di` es el único lugar donde se instancian implementaciones concretas.
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
- Toda lógica de negocio en un UseCase. Blocs y Cubits solo orquestan flujo, no razonan.
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
| Observer / BLoC | `presentation/features/*/bloc` | Estado reactivo, testeable y desacoplado de UI |
| Provider (Riverpod) | `presentation/features/*/providers` | Caché reactivo, estado simple, scoped |
| Dependency Injection | `config/di` con get_it | Bajo acoplamiento, facilita testing |
| Singleton | Servicios globales registrados en get_it | Una instancia controlada (AppDatabase, DioClient) |
| Mapper / Adapter | `infrastructure/mappers` | Conversión entre capas sin contaminar entidades |
| Command | `domain/usecases` | Encapsula y nombra operaciones de negocio |
| Composite | Widgets complejos en `presentation/common/widgets` | Composición reutilizable de UI |
| Strategy | Validadores, formatters en `core/utils` | Algoritmos intercambiables |
| Delegate | `presentation/delegates` | Búsqueda con SearchDelegate nativo de Flutter |

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
│   ├── usecases/                        # Un test por UseCase — mockear solo el repositorio
│   └── failures/
│
├── infrastructure/
│   ├── repositories/                    # Test del repo: lógica de coordinación remote/local
│   ├── datasources/
│   │   ├── remote/                      # Test con DioAdapter o http.MockClient + fixtures JSON
│   │   └── local/                       # Test de DAOs con NativeDatabase.memory() de Drift
│   └── mappers/                         # Test de conversión DTO ↔ Entidad
│
└── presentation/
    ├── common/widgets/                  # Widget tests de componentes comunes
    └── features/
        └── [feature]/
            ├── bloc/                    # Unit test del Bloc/Cubit con bloc_test
            └── pages/                   # Widget test de la page con providers/blocs mockeados
```

### Reglas de testing

- Cobertura mínima: 80% en `domain/` e `infrastructure/`
- Unit tests cubren todo `domain/` y `infrastructure/`
- Widget tests cubren todos los widgets de `common/` y las pages de cada feature
- Integration tests en `integration_test/` para flujos completos (home → detalle, búsqueda, favoritos)
- Mocking solo con `mocktail`. Prohibido `mockito` con generación de código
- Tests de BLoC usan el paquete `bloc_test` con `whenListen` y `expectLater`
- Tests de DAOs Drift usan `NativeDatabase.memory()` — nunca la base de datos real
- Cada fixture JSON en `test/helpers/fixtures/` corresponde a un endpoint real de TMDB

---

## 🔁 FLUJO DE GIT

### Ramas

```
main          → Código estable de producción. Solo merge desde develop mediante PR revisada
develop       → Rama de integración continua
feature/*     → Nueva funcionalidad  (feature/home-trending-list)
fix/*         → Corrección de bug    (fix/movie-detail-null-genre)
refactor/*    → Refactor sin cambio funcional
chore/*       → Dependencias, configuración, CI
test/*        → Añadir o mejorar tests sin cambiar código de producción
```

### Commits (Conventional Commits)

```
feat(home): add trending movies horizontal list
fix(search): resolve empty results on first query
refactor(domain): split movie usecase into fetch and search
test(favorites): add unit tests for toggle favorite usecase
chore(deps): upgrade dio to 5.x
```

### Pull Requests

- Todo merge a `develop` o `main` requiere PR con descripción de cambios.
- Título sigue la misma convención de commits.
- Incluir en descripción: qué cambia, tests añadidos, decisiones de diseño relevantes.

---

## 🤖 EQUIPO DE AGENTES

### Modelo de IA

Todos los agentes de este proyecto, incluido el orquestador, deben usar **claude-sonnet-4-5-20251001**.
Esto se configura en `.claude/settings.json` en la raíz del proyecto. Si un agente detecta que está corriendo con un modelo distinto, debe notificarlo al orquestador antes de continuar.

### Activación de paralelismo (requiere configuración externa a este archivo)

Para que los agentes trabajen simultáneamente hay que activar la variable de entorno antes de arrancar Claude Code. El CLAUDE.md define los roles y el número fijo, pero la paralelización real requiere esto en CMD (entorno Windows):

```cmd
:: Solo para la sesión actual de CMD
set CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=true
claude

:: Para hacerla permanente a nivel de usuario (ejecutar una sola vez, no requiere admin)
setx CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS true
```

> Si se usó `setx`, cerrar y reabrir CMD para que el valor esté disponible. A partir de entonces, basta con ejecutar `claude` directamente.

El orquestador tiene instrucción explícita de mantener siempre activos los 4 agentes especializados durante la fase de desarrollo activa, asignando trabajo en paralelo cuando las dependencias entre tareas lo permitan.

### Equipo fijo: 5 agentes especializados

| ID | Agente | Scope exclusivo |
|----|--------|----------------|
| `orchestrator` | Orquestador | Planificación, asignación, revisión de PRs, decisiones de arquitectura, gestión de `.agent/` |
| `domain-infra-agent` | Dominio e Infraestructura | `domain/`, `infrastructure/`, `config/di/`, `config/database/` |
| `presentation-agent` | Presentación | `presentation/`, `config/router/`, `config/theme/` |
| `test-agent` | Testing | `test/`, `integration_test/`, cobertura de tests unitarios |
| `product-qa-agent` | Calidad de Producto | Ejecución de app, validación funcional, detección de bugs, apertura de incidencias en `.agent/ISSUES.md` |

### Reglas del orquestador

1. **Al inicio de cada sesión:** Leer `.agent/BACKLOG.md` y procesar todas las peticiones pendientes del usuario, convirtiéndolas en tareas en `TASKS.md` y eliminando las líneas procesadas.
2. Mantener `.agent/TASKS.md` siempre actualizado antes de asignar cualquier tarea.
3. Respetar el orden de implementación por capas: `domain → infrastructure → config/di → presentation`.
4. Asignar tareas de capas independientes en paralelo cuando sea posible.
5. Nunca asignar a dos agentes tareas que modifiquen el mismo archivo simultáneamente.
6. **OBLIGATORIO:** Después de cada merge a `develop`, asignar tarea a `product-qa-agent` para validar funcionalmente lo mergeado.
7. Revisar el diff de cada agente antes de mergear a `develop`.
8. Proponer e implementar nuevas features autónomamente si mejoran la experiencia. Documentarlas en `.agent/DECISIONS.md`.
9. Interrumpir al usuario únicamente para: información de negocio no especificada, credenciales externas, o decisión que afecte irreversiblemente la arquitectura.

### Protocolo de recuperación de agente caído

Los subagentes son desechables por diseño. Cuando uno falla o no responde, el orquestador NUNCA debe asumir su trabajo directamente. El protocolo obligatorio es siempre este:

**Paso 1 — Evaluar el estado real antes de actuar:**
Revisar si el agente hizo commit de algo antes de caer o si la rama está limpia:
```cmd
git status
git log --oneline -5
```

**Paso 2 — Actualizar TASKS.md con el estado exacto:**
- Si no hizo commit → la tarea vuelve a `Pendiente` con nota `REINTENTAR`
- Si hizo commit parcial → la tarea pasa a `Interrumpida` detallando qué archivos están creados

**Paso 3 — Lanzar el agente de reemplazo con contexto completo:**
El nuevo agente recibe en su prompt inicial siempre estos tres datos:
1. La descripción completa de la tarea desde TASKS.md
2. El resultado de `git status` y `git log --oneline -5` de su rama
3. La instrucción explícita: "Retoma desde donde se quedó el agente anterior. No reescribas lo que ya está commiteado."

**Lo que el orquestador NUNCA debe hacer:**
- Ejecutar él mismo el trabajo de un agente especializado
- Crear un agente nuevo sin pasarle el contexto del estado actual
- Crear más de un agente de reemplazo para la misma tarea simultáneamente

---

### Reglas de todos los agentes

1. Leer este archivo completo antes de empezar cualquier tarea.
2. No modificar archivos fuera del propio scope sin notificación al orquestador.
3. Hacer commit al terminar cada unidad de trabajo. No acumular cambios sin commitear.
4. Antes de crear un archivo nuevo, verificar que no exista uno similar que deba extenderse.
5. Ante cualquier ambigüedad técnica, consultar `.agent/DECISIONS.md` primero.
6. Todo código nuevo debe ir acompañado de su test unitario mínimo en el mismo PR.
7. Actualizar `.agent/TASKS.md` marcando la tarea como completada al terminar.

### Reglas de Git — obligatorias antes de tocar cualquier archivo

- **NUNCA trabajar directamente en `main` ni en `develop`.**
- Lo primero al iniciar cualquier tarea es crear la rama correspondiente desde `develop`:
  ```cmd
  git checkout develop
  git pull origin develop
  git checkout -b feature/nombre-descriptivo
  ```
- Hacer al menos un commit por unidad lógica de trabajo completada en esa rama.
- Al terminar la tarea, hacer push de la rama y notificar al orquestador para que revise y mergee:
  ```cmd
  git push -u origin feature/nombre-descriptivo
  ```
- El orquestador es el único que mergea a `develop`. Ningún agente mergea directamente.

---

## 📁 ARCHIVOS DE COORDINACIÓN DE AGENTES (.agent/)

El directorio `.agent/` en la raíz del proyecto es el espacio de trabajo compartido entre agentes. Debe estar commiteado junto al código en el repositorio.

```
.agent/
├── BACKLOG.md         # Inbox del usuario: peticiones de features/bugs (usuario escribe, orquestador procesa)
├── TASKS.md           # Tablón de tareas: pendiente / en progreso / completada
├── DECISIONS.md       # Registro de decisiones técnicas autónomas del orquestador
├── BLOCKERS.md        # Impedimentos que requieren intervención del usuario
├── PROGRESS.md        # Resumen de progreso por fase para consulta rápida
└── ISSUES.md          # Incidencias de calidad abiertas por product-qa-agent
```

### Protocolo de BACKLOG.md

**BACKLOG.md** es el archivo exclusivo del usuario para solicitar nuevas features o reportar bugs sin tener que interrumpir al orquestador con explicaciones detalladas.

**Flujo de trabajo:**
1. **Usuario escribe** una línea por cada feature/bug que desee en `BACKLOG.md`
2. **Orquestador consulta** `BACKLOG.md` automáticamente:
   - Al inicio de cada sesión
   - Cuando el usuario ejecuta el comando "procesa el backlog" o similar
   - Cada vez que el usuario añade contenido y notifica
3. **Orquestador procesa** cada línea:
   - Crea una tarea formal en `TASKS.md` con ID, agente asignado, dependencias
   - Documenta la decisión en `DECISIONS.md` si requiere decisión arquitectónica
   - Elimina la línea procesada de `BACKLOG.md`
4. **Orquestador ejecuta** las tareas según prioridad y dependencias

**Formato del usuario en BACKLOG.md:**
```
[FEATURE] Descripción breve de la funcionalidad
[BUG] Descripción breve del error
[REFACTOR] Descripción breve de la refactorización
Sin etiqueta → Se asume FEATURE por defecto
```

**Ejemplo:**
```markdown
# BACKLOG.md

## 🔄 PETICIONES PENDIENTES

[FEATURE] Añadir modo claro/oscuro dinámico
[BUG] SearchDelegate no muestra resultados con espacios en el query
Implementar skeleton loaders en todas las listas
[REFACTOR] Extraer lógica de caché a un usecase separado
```

**Regla del orquestador:** NUNCA escribir en `BACKLOG.md` excepto para eliminar líneas ya procesadas. Este archivo es del usuario.

### Formato de TASKS.md

```markdown
## [FASE 1] Nombre de la fase actual

### En progreso
| ID | Tarea | Agente | Branch | Inicio |
|----|-------|--------|--------|--------|
| T-001 | Crear entidades Movie, Genre | domain-infra-agent | feature/domain-entities | YYYY-MM-DD |

### Pendiente
| ID | Tarea | Agente asignado | Dependencias | Notas |
|----|-------|----------------|--------------|-------|
| T-002 | Implementar TmdbRemoteDataSource | domain-infra-agent | T-001 | |
| T-003 | Setup go_router | presentation-agent | — | REINTENTAR |

### Interrumpida (agente caído con trabajo parcial)
| ID | Tarea | Branch | Último commit | Qué falta |
|----|-------|--------|--------------|-----------|
| T-004 | Crear HomeBloc | feature/home-bloc | a3f1c2e | Falta estado de error y tests |

### Completada
| ID | Tarea | Branch mergeado | Fecha |
|----|-------|----------------|-------|
| T-000 | Setup inicial del proyecto | develop | YYYY-MM-DD |
```

### Formato de DECISIONS.md

```markdown
## DEC-001 — Título de la decisión
- **Fecha:** YYYY-MM-DD
- **Agente:** orchestrator
- **Contexto:** Por qué fue necesaria esta decisión
- **Decisión:** Qué se decidió hacer
- **Alternativas descartadas:** Qué otras opciones había y por qué no se eligieron
- **Impacto:** Qué archivos o capas afecta
```

### Formato de BLOCKERS.md

```markdown
## BLOCKER-001 — Título
- **Fecha:** YYYY-MM-DD
- **Agente que lo detecta:** nombre-agente
- **Descripción:** Qué está bloqueado y por qué
- **Información necesaria del usuario:** Pregunta concreta y específica
- **Estado:** PENDIENTE / RESUELTO
```

### Formato de PROGRESS.md

```markdown
## Fase 1 — Estado general: EN PROGRESO

| Capa | Completado | Total tareas | % |
|------|-----------|-------------|---|
| domain | 3 | 5 | 60% |
| infrastructure | 1 | 6 | 16% |
| presentation | 0 | 8 | 0% |
| tests | 2 | 10 | 20% |

**Última actualización:** YYYY-MM-DD por orchestrator
```

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