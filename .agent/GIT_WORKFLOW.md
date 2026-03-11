# Git Workflow - AgenteCine

## Estructura de Ramas

```
main          → Producción (solo merge desde develop via PR)
  ↑
develop       → Integración continua (rama principal de desarrollo)
  ↑
feature/*     → Nueva funcionalidad
fix/*         → Corrección de bugs
refactor/*    → Refactorización sin cambio funcional
chore/*       → Dependencias, configuración, CI
test/*        → Añadir o mejorar tests
```

## Protocolo de Trabajo

### 1. Crear Feature Branch

Siempre desde `develop`:

```bash
git checkout develop
git pull origin develop
git checkout -b feature/nombre-descriptivo
```

Ejemplos:
- `feature/home-page-bloc`
- `feature/movie-detail-page`
- `feature/favorites-riverpod`

### 2. Desarrollo

- Hacer commits frecuentes con mensajes conventional commits
- Commits pequeños y atómicos
- Cada commit debe compilar sin errores

```bash
git add [archivos]
git commit -m "feat(scope): descripción

Detalles opcionales.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### 3. Merge a Develop

Cuando la feature esté completa:

```bash
# Asegurar que develop está actualizado
git checkout develop
git pull origin develop

# Mergear feature con --no-ff para preservar historial
git merge feature/nombre --no-ff -m "Merge feature/nombre into develop

Descripción de lo mergeado.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"

# Push a remoto
git push origin develop

# Eliminar feature branch
git branch -d feature/nombre
```

### 4. Pull Request a Main (cuando sea momento de release)

- Crear PR desde `develop` a `main`
- Incluir descripción completa de cambios
- Esperar revisión
- Merge con squash o merge commit según preferencia

## Conventional Commits

Formato: `<type>(<scope>): <descripción>`

**Types:**
- `feat`: Nueva funcionalidad
- `fix`: Corrección de bug
- `refactor`: Refactorización
- `test`: Tests
- `chore`: Configuración, dependencias
- `docs`: Documentación

**Scopes:**
- `domain`, `infrastructure`, `presentation`
- `theme`, `router`, `widgets`
- `home`, `detail`, `favorites`, etc.

## Estado Actual (2026-03-11)

### Ramas Existentes
- ✅ `main`: código estable (18 commits)
- ✅ `develop`: desarrollo activo (22 commits, 4 adelante de main)

### Trabajo Completado en Develop
- Domain layer 100%
- Infrastructure layer 100%
- Presentation layer 30% (theme, router, widgets comunes)

### Próximas Feature Branches
- `feature/home-page` (BLoC)
- `feature/movie-detail-page` (BLoC)
- `feature/search-delegate` (BLoC)
- `feature/favorites-page` (Riverpod)
- `feature/categories-page` (Riverpod)
- `feature/app-setup` (app.dart + main.dart)

## Reglas Importantes

1. **NUNCA** hacer commit directo en `main`
2. **NUNCA** hacer commit directo en `develop` (usar feature branches)
3. **SIEMPRE** usar `--no-ff` al mergear features
4. **SIEMPRE** eliminar feature branch después de merge
5. **SIEMPRE** pull antes de crear nueva branch
6. **NUNCA** usar `git push --force` en ramas compartidas
7. **SIEMPRE** incluir Co-Authored-By en commits
