# ISSUES.md — Incidencias de Calidad de Producto

> Este archivo es gestionado por **product-qa-agent**. Reporta bugs, problemas de UX, errores funcionales y mejoras de calidad detectadas durante la validación de producto.

---

## ISSUES ABIERTAS

## ISSUE-001 — App NO compila en Web debido a incompatibilidad Drift/sqlite3
- **Fecha apertura:** 2026-03-11
- **Severidad:** CRÍTICA
- **Tipo:** BLOCKER
- **Detectado en:** commit develop (2026-03-11)
- **Descripción:** La aplicación falla al compilar para web (flutter run -d chrome) debido a que el paquete `sqlite3` (dependencia de Drift) usa FFI (Foreign Function Interface) que NO es compatible con web. El compilador Dart2JS falla con "Unsupported operation: Unsupported invalid type InvalidType".
- **Impacto:**
  - La app NO puede ejecutarse en web
  - Contradice objetivo declarado de "móvil first" pero limita testing rápido en navegador
  - Favoritos no funcionarán en web mientras se use sqlite3
- **Evidencia:**
  ```
  Unhandled exception:
  Unsupported operation: Unsupported invalid type InvalidType(<invalid>)
  (InvalidType). Encountered while compiling
  file:///C:/Users/.../sqlite3-2.9.4/lib/src/ffi/implementation.dart
  The Dart compiler exited unexpectedly.
  Failed to compile application.
  ```
- **Pasos para reproducir:**
  1. `git checkout develop`
  2. `flutter run -d chrome`
  3. **Esperado:** App compila y abre en navegador
  4. **Real:** Compilación falla con error de sqlite3
- **Solución propuesta:**
  - Opción 1: Usar `drift_web` + implementación condicional por plataforma (web usa IndexedDB, móvil usa sqlite3)
  - Opción 2: Documentar explícitamente que web NO es soportado y solo usar Android/iOS/Desktop
  - Opción 3: Extraer favoritos a un repository que use SharedPreferences en web e IndexedDB nativo
- **Asignado a:** domain-infra-agent
- **Estado:** ABIERTA

---

## ISSUE-002 — Windows desktop no compila por falta de Visual Studio toolchain
- **Fecha apertura:** 2026-03-11
- **Severidad:** MEDIA
- **Tipo:** CONFIGURACIÓN
- **Detectado en:** commit develop (2026-03-11)
- **Descripción:** Al intentar ejecutar `flutter run -d windows`, falla con "Unable to find suitable Visual Studio toolchain". Esto es un problema del entorno de desarrollo, no del código, pero bloquea testing local en Windows.
- **Impacto:**
  - No se puede validar la app en Windows desktop en este ambiente
  - Limita opciones de testing a solo web (que tampoco funciona por ISSUE-001)
- **Evidencia:**
  ```
  Launching lib\main.dart on Windows in debug mode...
  Error: Unable to find suitable Visual Studio toolchain.
  Please run `flutter doctor` for more details.
  ```
- **Pasos para reproducir:**
  1. `flutter run -d windows`
  2. **Esperado:** App compila en Windows
  3. **Real:** Error por falta de VS toolchain
- **Solución propuesta:**
  - Instalar Visual Studio 2022 con "Desktop development with C++" workload
  - O ejecutar `flutter doctor` y seguir instrucciones
  - O priorizar testing en Android emulador
- **Asignado a:** orchestrator (decisión de ambiente)
- **Estado:** ABIERTA

---

## ISSUE-003 — 37 warnings de inferencia de tipos en análisis estático
- **Fecha apertura:** 2026-03-11
- **Severidad:** MEDIA
- **Tipo:** CODE_QUALITY
- **Detectado en:** commit develop (2026-03-11)
- **Descripción:** `flutter analyze` reporta 37 warnings de tipo "inference_failure_on_instance_creation" principalmente en tests (construcción de `Right<>`, `Left<>` de dartz) y en `home_state.dart` (construcción de `AsyncValue.loading`).
- **Impacto:**
  - Código menos type-safe
  - Puede causar errores sutiles en runtime
  - Viola regla de CLAUDE.md: "Nunca usar dynamic. Tipar siempre explícitamente"
- **Evidencia:**
  ```
  warning - The type argument(s) of the constructor 'AsyncValue.loading'
  can't be inferred - lib\presentation\features\home\bloc\home_state.dart:6:14

  warning - The type argument(s) of the constructor 'Right' can't be inferred
  - test\domain\usecases\get_favorites_test.dart:39:28
  ```
- **Archivos afectados:**
  - `lib/presentation/features/home/bloc/home_state.dart` (5 warnings)
  - `lib/presentation/features/movie_detail/bloc/movie_detail_state.dart` (1 warning)
  - `test/domain/usecases/*.dart` (31 warnings en tests)
- **Solución propuesta:**
  - Especificar tipos explícitos: `AsyncValue<List<Movie>>.loading()` en vez de `AsyncValue.loading()`
  - Especificar tipos en Either: `Right<Failure, List<Movie>>(mockMovies)` en vez de `Right(mockMovies)`
- **Asignado a:** qa-agent (para corregir tests) + presentation-agent (para corregir states)
- **Estado:** ABIERTA

---

## ISSUE-004 — 202 info issues de estilo de código
- **Fecha apertura:** 2026-03-11
- **Severidad:** BAJA
- **Tipo:** CODE_STYLE
- **Detectado en:** commit develop (2026-03-11)
- **Descripción:** `flutter analyze` reporta 202 issues de nivel "info" relacionadas con:
  - `directives_ordering` (imports no ordenados alfabéticamente): 34 ocurrencias
  - `prefer_int_literals` (uso innecesario de double literal cuando int es suficiente): 36 ocurrencias en `app_dimensions.dart`
  - `avoid_redundant_argument_values` (argumentos con valores default explícitos): 132 ocurrencias (mayoría en tests)
- **Impacto:**
  - No afecta funcionalidad
  - Reduce legibilidad del código
  - Viola convenciones de Dart
- **Solución propuesta:**
  - Ejecutar `dart fix --apply` para auto-fix donde sea posible
  - Reordenar imports manualmente si dart fix no los arregla
  - Cambiar `12.0` a `12` en app_dimensions.dart cuando sea double literal innecesario
  - Remover argumentos redundantes en tests
- **Asignado a:** qa-agent
- **Estado:** ABIERTA

---

## ISSUE-005 — Import no usado en movie_mapper.dart
- **Fecha apertura:** 2026-03-11
- **Severidad:** BAJA
- **Tipo:** CODE_QUALITY
- **Detectado en:** commit develop (2026-03-11)
- **Descripción:** El archivo `lib/infrastructure/mappers/movie_mapper.dart` tiene un import no usado de `cast_mapper.dart`.
- **Impacto:**
  - Import innecesario aumenta tamaño del bundle
  - Código menos limpio
- **Evidencia:**
  ```
  warning - Unused import: 'package:agente_cine/infrastructure/mappers/cast_mapper.dart'
  - lib\infrastructure\mappers\movie_mapper.dart:2:8
  ```
- **Solución propuesta:**
  - Remover la línea: `import 'package:agente_cine/infrastructure/mappers/cast_mapper.dart';`
- **Asignado a:** domain-infra-agent
- **Estado:** ABIERTA

---

## ISSUE-006 — Tipo Response sin argumentos explícitos en logging_interceptor
- **Fecha apertura:** 2026-03-11
- **Severidad:** MEDIA
- **Tipo:** CODE_QUALITY
- **Detectado en:** commit develop (2026-03-11)
- **Descripción:** En `lib/core/network/logging_interceptor.dart`, la variable de tipo `Response` no tiene tipo genérico explícito, viola regla de strict_raw_type.
- **Impacto:**
  - Menos type-safety
  - Viola regla de CLAUDE.md de no usar dynamic
- **Evidencia:**
  ```
  warning - The generic type 'Response<dynamic>' should have explicit type arguments
  but doesn't - lib\core\network\logging_interceptor.dart:18:19
  ```
- **Solución propuesta:**
  - Cambiar `Response` a `Response<dynamic>` explícitamente, o mejor aún, usar tipo específico si se conoce
- **Asignado a:** domain-infra-agent
- **Estado:** ABIERTA

---

## ISSUE-007 — SearchDelegate no está conectada en HomePage
- **Fecha apertura:** 2026-03-11
- **Severidad:** ALTA
- **Tipo:** FUNCIONALIDAD_INCOMPLETA
- **Detectado en:** revisión manual de código
- **Descripción:** En `lib/presentation/features/home/pages/home_page.dart` línea 46, el botón de búsqueda en AppBar tiene un `// TODO: Navigate to search` sin implementar. El archivo `movie_search_delegate.dart` existe pero no está conectado.
- **Impacto:**
  - Funcionalidad core de Fase 1 no operativa
  - Usuario no puede buscar películas desde HomePage
- **Evidencia:**
  ```dart
  IconButton(
    icon: const Icon(Icons.search),
    onPressed: () {
      // TODO: Navigate to search
    },
  ),
  ```
- **Pasos para reproducir:**
  1. Abrir app en HomePage
  2. Tap en icono de búsqueda
  3. **Esperado:** Abre SearchDelegate con buscador
  4. **Real:** No hace nada (TODO comentado)
- **Solución propuesta:**
  - Conectar con `showSearch(context: context, delegate: MovieSearchDelegate())`
  - Verificar que MovieSearchDelegate tenga DI correctamente configurado
- **Asignado a:** presentation-agent
- **Estado:** ABIERTA

---

## ISSUE-008 — Rutas de navegación usan placeholders en vez de páginas reales
- **Fecha apertura:** 2026-03-11
- **Severidad:** CRÍTICA
- **Tipo:** FUNCIONALIDAD_INCOMPLETA
- **Detectado en:** revisión de `lib/config/router/app_router.dart`
- **Descripción:** El router de la app (`app_router.dart`) define 6 rutas, pero 5 de ellas apuntan a `_PlaceholderPage` en vez de las páginas reales que SÍ existen en el codebase:
  - `/movie/:id` → placeholder (pero existe `MovieDetailPage`)
  - `/favorites` → placeholder (pero existe `FavoritesPage`)
  - `/categories` → placeholder (pero existe `CategoriesPage`)
  - `/categories/:genreId/movies` → placeholder (pero existe `CategoryMoviesPage`)
  - `/search` → placeholder
- **Impacto:**
  - Navegación no funciona aunque las páginas estén implementadas
  - 80% de features de Fase 1 son inaccesibles
  - Usuario solo puede ver HomePage
- **Evidencia:**
  ```dart
  // Línea 30-31 de app_router.dart
  GoRoute(
    path: AppRoutes.favorites,
    name: 'favorites',
    builder: (context, state) => const _PlaceholderPage(title: 'Favorites'),
  ),
  ```
- **Solución propuesta:**
  - Reemplazar todos los `_PlaceholderPage` con las páginas reales que ya existen:
    ```dart
    import 'package:agente_cine/presentation/features/movie_detail/pages/movie_detail_page.dart';
    import 'package:agente_cine/presentation/features/favorites/pages/favorites_page.dart';
    import 'package:agente_cine/presentation/features/categories/pages/categories_page.dart';
    import 'package:agente_cine/presentation/features/categories/pages/category_movies_page.dart';

    // Y actualizar los builders correspondientes
    ```
- **Asignado a:** presentation-agent
- **Estado:** ABIERTA

---

## ISSUE-009 — No hay navegación funcional entre HomePage y otras páginas
- **Fecha apertura:** 2026-03-11
- **Severidad:** ALTA
- **Tipo:** FUNCIONALIDAD_INCOMPLETA
- **Detectado en:** revisión manual de código
- **Descripción:** Aunque `HomePage` muestra listas de películas (via `MovieCard`), no hay forma de:
  - Navegar a detalle de película al hacer tap en una MovieCard
  - Acceder a página de Favoritos
  - Acceder a página de Categorías
  - No hay BottomNavigationBar ni Drawer para navegar entre secciones principales
- **Impacto:**
  - Usuario queda atrapado en HomePage
  - Flujo completo de la app no es testeable
  - UX incompleta
- **Pasos para reproducir:**
  1. Abrir app (hipotético, no compila)
  2. Ver lista de películas
  3. Intentar tap en una película
  4. **Esperado:** Navega a detalle
  5. **Real:** Nada sucede (sin onTap handler)
- **Solución propuesta:**
  - Añadir `onTap` a `MovieCard` que ejecute `context.go('/movie/${movie.id}')`
  - Añadir BottomNavigationBar o NavigationRail en HomePage con opciones: Home, Categories, Favorites
  - O añadir Drawer con menú de navegación
- **Asignado a:** presentation-agent
- **Estado:** ABIERTA

---

## ISSUE-010 — PROGRESS.md reporta Fase 1 al 100% pero muchas features están incompletas
- **Fecha apertura:** 2026-03-11
- **Severidad:** MEDIA
- **Tipo:** DOCUMENTACIÓN
- **Detectado en:** revisión de `.agent/PROGRESS.md`
- **Descripción:** El archivo `PROGRESS.md` dice "Fase 1 — Setup y arquitectura base: COMPLETADA ✅ (100%)" pero contradictoriamente el Hito 4 (UI) muestra solo 30% completo con muchas páginas marcadas como ⏳ pendientes. Además, las páginas que sí existen NO están conectadas al router (ISSUE-008).
- **Impacto:**
  - Documentación engañosa
  - Orquestador puede tomar decisiones basadas en información incorrecta
  - Usuario puede creer que Fase 1 está lista cuando no lo está
- **Evidencia:**
  ```markdown
  ## Fase 1 — Setup y arquitectura base: COMPLETADA ✅ (100%)
  ...
  ### Hito 4 - UI (30% completo) 🚧
  - ⏳ HomePage con BLoC
  - ⏳ MovieDetailPage con BLoC
  ...
  ```
- **Solución propuesta:**
  - Actualizar PROGRESS.md con estado REAL:
    - Fase 1 estado: EN PROGRESO (no COMPLETADA)
    - Hito 4 expandir con subitems reales:
      - ✅ HomePage existe pero no conecta navegación
      - ✅ MovieDetailPage existe pero no está en router
      - etc.
- **Asignado a:** orchestrator
- **Estado:** ABIERTA

---

## ISSUES CERRADAS

_Historial de incidencias resueltas._

---

## FORMATO DE ISSUE

```markdown
## ISSUE-XXX — Título descriptivo
- **Fecha apertura:** YYYY-MM-DD
- **Severidad:** CRÍTICA / ALTA / MEDIA / BAJA
- **Tipo:** BUG / UX / PERFORMANCE / FUNCIONAL
- **Detectado en:** Branch/Commit
- **Descripción:** Qué falla y cómo reproducirlo
- **Impacto:** A quién afecta y cuánto
- **Pasos para reproducir:**
  1. Paso 1
  2. Paso 2
  3. Resultado esperado vs real
- **Asignado a:** nombre-agente (si aplica)
- **Estado:** ABIERTA / EN PROGRESO / CERRADA
- **Fecha cierre:** YYYY-MM-DD (cuando se resuelva)
```
