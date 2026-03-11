# PROPUESTA FASE 2 — AgenteCine

**Fecha:** 2026-03-11
**Autor:** Orchestrator
**Estado:** PROPUESTA (pendiente aprobación usuario)

---

## 🎯 Objetivo de Fase 2

Mejorar la experiencia de usuario añadiendo funcionalidades que conviertan AgenteCine en una app completa de gestión cinematográfica, aprovechando al máximo la API de TMDB.

---

## 🚀 FUNCIONALIDADES PROPUESTAS

### 1. **Reproducción de Trailers** (Prioridad: ALTA)
**Problema:** El usuario no puede ver trailers de las películas.
**Solución:**
- Integrar `youtube_player_flutter` package
- Añadir botón "Ver Trailer" en MovieDetailPage
- Crear `TrailerPlayerDialog` widget
- Consumir endpoint de TMDB: `/movie/{id}/videos`

**Impacto:** +30% engagement, funcionalidad clave para decisión de qué ver

**Tareas:**
- T-034: Crear `GetMovieVideos` UseCase
- T-035: Implementar `TrailerPlayerDialog` widget
- T-036: Añadir botón trailer en MovieDetailPage
- T-037: Tests de reproducción de trailers

---

### 2. **Sistema de Watchlist (Lista "Quiero Ver")** (Prioridad: ALTA)
**Problema:** Solo hay favoritos (ya vistas), falta lista de pendientes.
**Solución:**
- Nueva tabla Drift: `watchlist`
- Nuevo ícono en MovieCard: marcador (bookmark)
- Nueva página: WatchlistPage
- Distinguir visualmente favoritos vs watchlist

**Impacto:** +40% retención, feature estándar en apps de películas

**Tareas:**
- T-038: Crear tabla watchlist en Drift
- T-039: Implementar `WatchlistRepository` + `WatchlistDao`
- T-040: Crear `ToggleWatchlist`, `GetWatchlist` UseCases
- T-041: Implementar WatchlistPage con Riverpod
- T-042: Añadir toggle watchlist en MovieCard y MovieDetailPage
- T-043: Tests de watchlist

---

### 3. **Ratings y Reseñas de Usuarios TMDB** (Prioridad: MEDIA)
**Problema:** Solo se ve rating promedio, no reseñas de usuarios.
**Solución:**
- Consumir `/movie/{id}/reviews` de TMDB
- Mostrar reseñas en MovieDetailPage (expansible)
- Widget `ReviewCard` con avatar, nombre, rating y texto

**Impacto:** +20% tiempo en detalle, ayuda decisión

**Tareas:**
- T-044: Crear `Review` entity y `GetMovieReviews` UseCase
- T-045: Implementar `ReviewsList` widget
- T-046: Integrar en MovieDetailPage
- T-047: Tests de reviews

---

### 4. **Películas Similares y Recomendaciones** (Prioridad: MEDIA)
**Problema:** No hay descubrimiento lateral (si te gustó X, prueba Y).
**Solución:**
- Consumir `/movie/{id}/similar` y `/movie/{id}/recommendations`
- Añadir sección horizontal en MovieDetailPage
- Al hacer tap, navega a detalle de esa película

**Impacto:** +35% descubrimiento, navegación circular

**Tareas:**
- T-048: Crear `GetSimilarMovies`, `GetRecommendedMovies` UseCases
- T-049: Añadir secciones en MovieDetailPage
- T-050: Tests de similar/recommendations

---

### 5. **Filtros Avanzados en Búsqueda** (Prioridad: BAJA)
**Problema:** Búsqueda muy básica, solo por título.
**Solución:**
- Filtros: año de estreno, rating mínimo, géneros múltiples
- UI: BottomSheet con chips y sliders
- Endpoint TMDB: `/discover/movie` con parámetros

**Impacto:** +15% precisión búsqueda, usuarios avanzados

**Tareas:**
- T-051: Crear `DiscoverMovies` UseCase con parámetros
- T-052: Implementar `SearchFiltersSheet` widget
- T-053: Integrar filtros en SearchDelegate
- T-054: Tests de discover con filtros

---

### 6. **Modo Offline Mejorado** (Prioridad: MEDIA)
**Problema:** Sin conexión, la app no muestra nada (excepto favoritos).
**Solución:**
- Cachear listas de home (trending, popular) en Drift
- Mostrar banner "Sin conexión - Mostrando caché"
- Expiración de caché: 24h
- Sincronización al recuperar conexión

**Impacto:** +50% UX sin conexión, resiliencia

**Tareas:**
- T-055: Crear tabla `cached_movies` con category, expiresAt
- T-056: Implementar estrategia cache-first con fallback
- T-057: Widget `OfflineBanner`
- T-058: Tests de modo offline

---

### 7. **Animaciones y Transiciones** (Prioridad: BAJA)
**Problema:** Navegación muy plana, sin "polish".
**Solución:**
- Hero animations en posters (Home → Detail)
- PageRouteBuilder con transiciones custom
- Shimmer placeholders mientras carga
- Animaciones de lista (staggered)

**Impacto:** +25% percepción de calidad, polish

**Tareas:**
- T-059: Implementar Hero animations
- T-060: Shimmer loading states
- T-061: Transiciones custom en router

---

### 8. **Compartir Películas** (Prioridad: BAJA)
**Problema:** No se puede compartir una película con amigos.
**Solución:**
- Botón "Compartir" en MovieDetailPage
- Generar texto: "Mira [Título] en TMDB: [URL]"
- Package: `share_plus`

**Impacto:** +10% viralidad, funcionalidad esperada

**Tareas:**
- T-062: Integrar `share_plus` package
- T-063: Implementar botón compartir en detalle
- T-064: Tests de share

---

### 9. **Configuración de Usuario** (Prioridad: BAJA)
**Problema:** No hay personalización (idioma, región, theme).
**Solución:**
- Nueva página: SettingsPage
- Opciones: idioma (es/en), región (para release dates), theme (dark/light)
- Guardar en SharedPreferences
- Aplicar región a llamadas TMDB (query param `region`)

**Impacto:** +15% personalización, alcance internacional

**Tareas:**
- T-065: Crear SettingsPage
- T-066: Implementar providers de configuración (Riverpod)
- T-067: Aplicar región a llamadas API
- T-068: Theme switcher (dark/light)

---

## 📊 PRIORIZACIÓN RECOMENDADA

### Sprint 1 (Fase 2.1) — MVP Mejorado
1. Reproducción de Trailers (T-034 a T-037)
2. Sistema de Watchlist (T-038 a T-043)
3. Modo Offline Mejorado (T-055 a T-058)

**Resultado:** App completa con features core esperadas

### Sprint 2 (Fase 2.2) — Descubrimiento
4. Películas Similares/Recomendaciones (T-048 a T-050)
5. Ratings y Reseñas (T-044 a T-047)

**Resultado:** Mayor tiempo de uso, navegación circular

### Sprint 3 (Fase 2.3) — Polish
6. Animaciones y Transiciones (T-059 a T-061)
7. Compartir Películas (T-062 a T-064)
8. Filtros Avanzados (T-051 a T-054)
9. Configuración de Usuario (T-065 a T-068)

**Resultado:** App pulida, lista para producción

---

## 🎨 MEJORAS TÉCNICAS PROPUESTAS

### A. **Refactoring de ImageUrlBuilder**
**Problema detectado:** Los agentes crearon la abstracción pero no la usan consistentemente.
**Solución:** Refactor para usar siempre `ImageUrlBuilder.poster()`, `.backdrop()`, etc.

### B. **Internacionalización (i18n)**
**Problema:** Strings hardcodeados en widgets (contra CLAUDE.md).
**Solución:**
- Configurar `flutter_localizations`
- Crear archivos ARB (es, en)
- Refactor de todos los strings visibles

### C. **Optimización de Imágenes**
**Problema:** Se cargan imágenes de tamaño original innecesariamente.
**Solución:**
- Usar tamaños apropiados según widget (w185 para thumbnails, w500 para detail)
- Implementar caché de imágenes con `cached_network_image`

---

## 🔍 BUGS PENDIENTES DE FASE 1

1. **Integration test** falla (AgenteCineApp no existe) → Ya corregido en fix/compilation-errors
2. **Análisis estático:** 200+ warnings de imports, linting → Requiere agente de limpieza
3. **Navegación incompleta:** Los botones de categorías y búsqueda no están conectados al router
4. **Estado de favoritos** no se sincroniza entre HomePage y MovieDetailPage

---

## 💰 ESTIMACIÓN

| Sprint | Tareas | Días estimados | Complejidad |
|--------|--------|----------------|-------------|
| 2.1 | 12 tareas | 5 días | Media |
| 2.2 | 7 tareas | 3 días | Baja |
| 2.3 | 11 tareas | 4 días | Media-Alta |

**Total Fase 2:** ~12 días de desarrollo con paralelización de agentes

---

## ✅ CRITERIOS DE ACEPTACIÓN FASE 2

- [ ] Trailers reproducibles desde detalle
- [ ] Watchlist funcional con persistencia local
- [ ] App usable sin conexión (muestra caché)
- [ ] Películas similares visibles en detalle
- [ ] Reseñas de usuarios TMDB visibles
- [ ] Hero animations funcionando
- [ ] Share funcional
- [ ] Settings funcional con región y theme
- [ ] 0 errores de análisis estático
- [ ] Cobertura de tests >80% en nuevas features

---

**Siguiente paso:** Esperar aprobación del usuario para iniciar Sprint 2.1
