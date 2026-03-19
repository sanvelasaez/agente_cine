# TASKS.md

## [FASE 1] Setup y arquitectura base del proyecto — COMPLETADA ✅

### En progreso
| ID | Tarea | Agente | Branch | Inicio |
|----|-------|--------|--------|--------|
| - | - | - | - | - |

### Pendiente
| ID | Tarea | Agente asignado | Dependencias | Notas |
|----|-------|----------------|--------------|-------|
| T-103 | Añadir dependencia animate_do al proyecto | orchestrator | — | BACKLOG: Fase 2 UX |
| T-104 | Implementar flecha de navegación para volver atrás en todas las páginas | presentation-agent | T-103 | BACKLOG: Navegación |
| T-105 | Hacer barra de navegación inferior fija en todas las pantallas | presentation-agent | — | BACKLOG: Navegación |
| T-106 | Implementar animaciones creativas con animate_do en toda la app | presentation-agent | T-103, T-104, T-105 | BACKLOG: UX mejorada |
| T-107 | Crear tests para las nuevas funcionalidades de Fase 2 | test-agent | T-104, T-105, T-106 | Testing Fase 2 |
| T-108 | Rediseñar rating en MovieCard: círculo coloreado con puntuación | presentation-agent | — | BACKLOG: Sustituir estrellas por círculo en esquina inferior izquierda con color según puntuación (rojo/amarillo/verde) |

### Completada
| ID | Tarea | Branch mergeado | Fecha |
|----|-------|----------------|-------|
| T-000 | Inicialización del proyecto Flutter | main | 2026-03-11 |
| T-001 | Configurar dependencias en pubspec.yaml | main | 2026-03-11 |
| T-002 | Crear estructura completa de directorios | main | 2026-03-11 |
| T-003 | Configurar análisis estático (analysis_options.yaml) | main | 2026-03-11 |
| T-004 a T-020 | Setup completo de core, domain, infrastructure y presentation base | develop | 2026-03-11 |
| T-021 | Implementar HomePage con BLoC | feature/home-page → develop | 2026-03-11 |
| T-022 | Implementar MovieDetailPage | feature/movie-detail-page → develop | 2026-03-11 |
| T-023 | Implementar SearchDelegate | feature/search-delegate → develop | 2026-03-11 |
| T-024 | Implementar FavoritesPage | feature/favorites-page → develop | 2026-03-11 |
| T-025 | Implementar CategoriesPage | feature/categories-page → develop | 2026-03-11 |
| T-026 | Crear app.dart | feature/app-setup → develop | 2026-03-11 |
| T-027 | Actualizar main.dart | feature/app-setup → develop | 2026-03-11 |
| T-028 a T-033 | Suite completa de testing (84 tests) | test/complete-test-suite → develop | 2026-03-11 |
| T-034 | Fix: Conectar router a páginas reales | fix/router-real-pages → develop | 2026-03-11 |
| T-035 | Fix: Conectar SearchDelegate desde HomePage | fix/search-delegate-di → develop | 2026-03-11 |
| T-036 | Fix: Eliminar imports, tipos raw, warnings | fix/code-quality-cleanup → develop | 2026-03-11 |
| T-037 | Fix: Aplicar dart fix para estilo | fix/final-quality-cleanup → develop | 2026-03-11 |
| T-038 | Docs: Documentar que web no está soportado | docs/web-not-supported → develop | 2026-03-11 |
