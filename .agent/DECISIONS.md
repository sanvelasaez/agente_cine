# DECISIONS.md — Registro de decisiones técnicas

## DEC-001 — Orden de implementación de la Fase 1
- **Fecha:** 2026-03-11
- **Agente:** orchestrator
- **Contexto:** Fase inicial del proyecto, necesidad de establecer el orden correcto de implementación respetando dependencias arquitectónicas
- **Decisión:**
  1. Setup inicial (T-001 a T-003): pubspec, estructura de carpetas, linting
  2. Core y Domain (T-004 a T-008): utilidades, failures, entidades, contratos, usecases
  3. Infrastructure (T-009 a T-017): red, DTOs, mappers, datasources, repos, DI, build_runner
  4. Presentation (T-018 a T-027): theme, router, widgets, pages, app.dart, main.dart
  5. Testing (T-028 a T-033): tests por capa en orden paralelo cuando la implementación esté lista
- **Alternativas descartadas:**
  - Implementar UI primero con datos mockeados: violaría el principio de domain-first
  - Hacer todo en una sola rama gigante: dificultaría rollback y revisión
- **Impacto:** Todas las capas. Este orden se refleja en el TASKS.md como dependencias explícitas

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
- **Contexto:** Favoritos deben persistir offline. Listas de películas pueden cachearse para mejorar UX
- **Decisión:**
  - Tabla `favorites` (obligatoria): id, movieId, addedAt
  - Tabla `cached_movies` (opcional para Fase 1): movieId, category, data JSON, cachedAt, expiresAt
  - Estrategia: remote-first con fallback a cache si falla red
- **Alternativas descartadas:**
  - SharedPreferences para favoritos: límite de tamaño, no relacional
  - No cachear listas: experiencia pobre sin conexión
- **Impacto:** `config/database/tables/`, `infrastructure/datasources/local/`, `infrastructure/repositories/`

## DEC-005 — Decisión de implementación autónoma por el orquestador
- **Fecha:** 2026-03-11
- **Agente:** orchestrator
- **Contexto:** Los 3 agentes spawneados (domain-infra, presentation, qa) permanecieron en idle sin responder a mensajes ni tomar tareas. Tras múltiples intentos de activación sin éxito, el orquestador decidió continuar autónomamente.
- **Decisión:**
  - Desactivar sistema de equipos temporalmente
  - Orquestador implementa todas las tareas de forma secuencial respetando dependencias
  - Mantener estructura de tareas y tracking en .agent/ para documentación
  - Commits frecuentes por tarea completada
  - Resultados hasta ahora: 14 tareas completadas exitosamente en main
- **Alternativas descartadas:**
  - Esperar a que los agentes respondan: bloqueante e indefinido
  - Reiniciar agentes: sin garantía de éxito
- **Impacto:** Mayor velocidad de desarrollo, control total del orquestador, infraestructura de team queda lista para futuro uso cuando el sistema madure

## DEC-004 — Activación de equipo de 3 agentes en paralelo
- **Fecha:** 2026-03-11
- **Agente:** orchestrator
- **Contexto:** Necesidad de ejecutar 35 tareas de forma eficiente respetando dependencias arquitectónicas
- **Decisión:**
  - Crear team "agente-cine-team" con 3 agentes especializados activos simultáneamente:
    1. **domain-infra-agent**: 13 tareas (T-001 a T-015 del plan original, #1-15 en TaskList)
    2. **presentation-agent**: 10 tareas (#20-29 en TaskList)
    3. **qa-agent**: 6 tareas (#30-35 en TaskList)
  - Orden de ejecución:
    1. domain-infra-agent arranca con #1, #2, #3 en paralelo (sin dependencias)
    2. presentation-agent arranca con #28, #25 en paralelo (theme y router, independientes)
    3. qa-agent espera hasta que se desbloqueen sus tareas
  - Cada agente ejecuta tareas en paralelo cuando las dependencias lo permiten
  - Commits frecuentes por tarea completada
- **Alternativas descartadas:**
  - Ejecutar secuencialmente: lento, subutiliza capacidad de paralelización
  - Un solo agente: no respeta especialización, dificulta tracking
- **Impacto:** Velocidad de desarrollo x3, mejor separación de responsabilidades, tracking granular por capa
