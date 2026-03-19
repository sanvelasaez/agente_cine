# TASKS.md

## [FASE 1] Setup y arquitectura base del proyecto — COMPLETADA ✅

## [FASE 2] Navegación mejorada, animaciones y UX — COMPLETADA ✅

## [FASE 3] Bugfixes y mejoras de UX

### En progreso
| ID | Tarea | Agente | Branch | Inicio |
|----|-------|--------|--------|--------|
| T-201, T-202 | Fix bugs críticos: BottomNav + búsqueda | presentation-agent | fix/critical-bugs-phase3 | 2026-03-19 |

### Pendiente
| ID | Tarea | Agente asignado | Dependencias | Notas |
|----|-------|----------------|--------------|-------|
| T-203 | Feature: Añadir botón "Ver más" en secciones de películas | presentation-agent | T-201 | Nueva pantalla con grid completo |
| T-204 | Feature: Mover búsqueda a bottomNav y eliminar AppBar | presentation-agent | T-201, T-202 | Búsqueda accesible desde cualquier pantalla |
| T-205 | Feature: Eliminar título de MovieCard | presentation-agent | — | UI más limpia y minimalista |

### Completada Fase 2
| ID | Tarea | Branch mergeado | Fecha |
|----|-------|----------------|-------|
| T-107 | Tests para funcionalidades Fase 2 (26 tests nuevos, 110 total) | test/phase2-features → develop | 2026-03-19 |
| T-106 | Implementar animaciones con animate_do | feature/animations-animate-do → develop | 2026-03-19 |
| T-104, T-105 | Mejoras de navegación (back button + bottomNav persistente) | feature/navigation-improvements → develop | 2026-03-19 |
| T-108 | Rediseñar rating en MovieCard: círculo coloreado | feature/rating-circle-design → develop | 2026-03-19 |
| T-103 | Añadir dependencia animate_do 4.2.0 | develop | 2026-03-19 |

### Completada Fase 1
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
