# TASKS.md

## [FASE 1] Setup y arquitectura base del proyecto

### En progreso
| ID | Tarea | Agente | Branch | Inicio |
|----|-------|--------|--------|--------|
| - | - | - | - | - |

### Pendiente
| ID | Tarea | Agente asignado | Dependencias |
|----|-------|----------------|--------------|
| T-001 | Configurar dependencias en pubspec.yaml | orchestrator | - |
| T-002 | Crear estructura completa de directorios | orchestrator | T-001 |
| T-003 | Configurar análisis estático (analysis_options.yaml) | orchestrator | T-001 |
| T-004 | Implementar Logger y utilidades core | domain-infra-agent | T-002 |
| T-005 | Crear jerarquía de Failures en domain | domain-infra-agent | T-002 |
| T-006 | Crear entidades: Movie, Genre, Cast | domain-infra-agent | T-002 |
| T-007 | Crear contratos de repositorios en domain | domain-infra-agent | T-006 |
| T-008 | Implementar UseCases básicos (GetTrending, GetPopular, etc.) | domain-infra-agent | T-007 |
| T-009 | Configurar DioFactory con interceptores | domain-infra-agent | T-004 |
| T-010 | Crear modelos DTO (MovieDto, GenreDto, etc.) | domain-infra-agent | T-006 |
| T-011 | Implementar mappers DTO → Entity | domain-infra-agent | T-010 |
| T-012 | Implementar TmdbRemoteDataSource | domain-infra-agent | T-009, T-010 |
| T-013 | Configurar Drift: AppDatabase, tablas, DAOs | domain-infra-agent | T-006 |
| T-014 | Implementar DriftLocalDataSource (favoritos) | domain-infra-agent | T-013 |
| T-015 | Implementar MovieRepositoryImpl | domain-infra-agent | T-012, T-014 |
| T-016 | Configurar get_it + injectable (DI) | domain-infra-agent | T-015 |
| T-017 | Ejecutar build_runner para generación de código | domain-infra-agent | T-016 |
| T-018 | Configurar ThemeData y tokens de diseño | presentation-agent | T-002 |
| T-019 | Configurar GoRouter con rutas nombradas | presentation-agent | T-002 |
| T-020 | Crear widgets comunes (MovieCard, LoadingIndicator, etc.) | presentation-agent | T-018 |
| T-021 | Implementar HomePage con BLoC/Riverpod | presentation-agent | T-017, T-020 |
| T-022 | Implementar MovieDetailPage | presentation-agent | T-017, T-020 |
| T-023 | Implementar SearchDelegate para búsqueda | presentation-agent | T-017, T-020 |
| T-024 | Implementar FavoritesPage | presentation-agent | T-017, T-020 |
| T-025 | Implementar CategoriesPage | presentation-agent | T-017, T-020 |
| T-026 | Crear app.dart con MaterialApp.router | presentation-agent | T-019, T-018 |
| T-027 | Actualizar main.dart con DI y zonas de error | presentation-agent | T-017, T-026 |
| T-028 | Tests unitarios de domain (entities, usecases) | qa-agent | T-008 |
| T-029 | Tests unitarios de infrastructure (datasources, repos, mappers) | qa-agent | T-015 |
| T-030 | Tests de widgets comunes | qa-agent | T-020 |
| T-031 | Tests de BLoCs/Cubits | qa-agent | T-021, T-022, T-023, T-024, T-025 |
| T-032 | Tests de integración (flujos E2E) | qa-agent | T-027 |
| T-033 | Verificar cobertura mínima 80% | qa-agent | T-028, T-029, T-030, T-031 |

### Completada
| ID | Tarea | Branch mergeado | Fecha |
|----|-------|----------------|-------|
| T-000 | Inicialización del proyecto Flutter | main | 2026-03-11 |
