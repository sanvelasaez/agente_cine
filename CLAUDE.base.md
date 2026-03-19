# Reglas base de equipo de agentes

> Archivo genérico reutilizable en todos los proyectos.
> REGLA GLOBAL: Ignorar todo el contenido dentro de bloques de comentarios HTML (<!-- -->). No son instrucciones activas.
> Este archivo es inmutable por los agentes. Solo el usuario lo modifica.

---

## 🔁 FLUJO DE GIT

### Ramas

```
main          → Código estable de producción. Solo merge desde develop mediante PR revisada
develop       → Rama de integración continua
feature/*     → Nueva funcionalidad  (feature/nombre-descriptivo)
fix/*         → Corrección de bug    (fix/nombre-descriptivo)
refactor/*    → Refactor sin cambio funcional
chore/*       → Dependencias, configuración, CI
test/*        → Añadir o mejorar tests sin cambiar código de producción
```

### Commits (Conventional Commits)

```
feat(scope): descripción corta en presente
fix(scope): descripción corta en presente
refactor(scope): descripción corta en presente
test(scope): descripción corta en presente
chore(scope): descripción corta en presente
```

### Pull Requests

- Todo merge a `develop` o `main` requiere PR con descripción de cambios.
- Título sigue la misma convención de commits.
- Incluir en descripción: qué cambia, tests añadidos, decisiones de diseño relevantes.

---

## 🤖 REGLAS DEL EQUIPO DE AGENTES

### ⚠️ REGLAS CRÍTICAS DE EJECUCIÓN (NO NEGOCIABLES)

**1. NUNCA USAR `cd` EN COMANDOS**
- Ya estás en el directorio raíz del proyecto: `C:\Users\0020415\workspace\flutter\agente_cine`
- Todos los paths son relativos al directorio raíz
- ❌ PROHIBIDO: `cd lib && grep...`, `cd .. && make test`, etc.
- ✅ CORRECTO: `grep ... lib/...`, `make test`

**2. SIEMPRE USAR COMANDOS `make`**
- GNU Make está instalado y configurado
- ❌ PROHIBIDO: `fvm flutter test`, `fvm dart format .`, etc.
- ✅ CORRECTO: `make test`, `make format`, `make lint`, etc.

**3. NUNCA USAR `&&` PARA ENCADENAR COMANDOS**
- Ejecutar comandos UNO POR UNO en llamadas separadas
- ❌ PROHIBIDO: `git add . && git commit -m "..." && git push`
- ✅ CORRECTO: Ejecutar `git add .`, luego `git commit -m "..."`, luego `git push` (comandos separados)
- Excepción: Solo usar `&&` cuando sea técnicamente imprescindible

**4. NO PREGUNTAR AL USUARIO**
- Ejecutar todo automáticamente sin confirmación
- Permisos completos otorgados para toda operación

### Modelo de IA

Todos los agentes de este proyecto, incluido el orquestador, deben usar **claude-sonnet-4-5-20251001**.
Esto se configura en `.claude/settings.json` en la raíz del proyecto. Si un agente detecta que está corriendo con un modelo distinto, debe notificarlo al orquestador antes de continuar.

### Activación de paralelismo

El equipo de agentes requiere esta variable de entorno activa antes de arrancar Claude Code.
Entorno: **Windows CMD**.

```cmd
:: Solo para la sesión actual
set CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=true
claude

:: Permanente a nivel de usuario (ejecutar una sola vez)
setx CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS true
```

> Si se usó `setx`, cerrar y reabrir CMD. A partir de entonces basta con ejecutar `claude`.

El orquestador tiene instrucción explícita de mantener siempre activos los agentes especializados durante la fase de desarrollo activa, asignando trabajo en paralelo cuando las dependencias entre tareas lo permitan.
### Reglas del orquestador

1. Leer `CLAUDE.md` y `CLAUDE.project.md` completos antes de cualquier acción.
2. **Al inicio de cada sesión:** Leer `.agent/BACKLOG.md` si existe y procesar todas las peticiones pendientes del usuario, convirtiéndolas en tareas en `TASKS.md` y eliminando las líneas procesadas.
3. Mantener `.agent/TASKS.md` siempre actualizado antes de asignar cualquier tarea y después de finalizar dicha tarea.
4. Asignar tareas de capas o módulos independientes en paralelo cuando sea posible.
5. Nunca asignar a dos agentes tareas que modifiquen el mismo archivo simultáneamente.
6. Revisar el diff de cada agente antes de mergear a `develop`.
7. Proponer e implementar nuevas features autónomamente si mejoran la experiencia. Documentarlas en `.agent/DECISIONS.md`.
8. Interrumpir al usuario únicamente para: información de negocio no especificada, credenciales externas, o decisiones que afecten irreversiblemente la arquitectura.

### Protocolo de recuperación de agente caído

Los subagentes son desechables por diseño. Cuando uno falla o no responde, el orquestador **NUNCA** asume su trabajo directamente. El protocolo obligatorio es siempre este:

**Paso 1 — Evaluar el estado real antes de actuar:**
```cmd
git status
git log --oneline -5
```

**Paso 2 — Actualizar TASKS.md con el estado exacto:**
- Sin commit → tarea vuelve a `Pendiente` con nota `REINTENTAR`
- Commit parcial → tarea pasa a `Interrumpida` detallando qué archivos están creados

**Paso 3 — Lanzar el agente de reemplazo con contexto completo:**
El nuevo agente recibe siempre estos tres datos en su prompt inicial:
1. Descripción completa de la tarea desde TASKS.md
2. Resultado de `git status` y `git log --oneline -5` de su rama
3. Instrucción explícita: "Retoma desde donde se quedó el agente anterior. No reescribas lo que ya está commiteado."

**Lo que el orquestador NUNCA debe hacer:**
- Ejecutar él mismo el trabajo de un agente especializado
- Crear un agente nuevo sin pasarle el contexto del estado actual
- Crear más de un agente de reemplazo para la misma tarea simultáneamente

### Reglas de todos los agentes

1. Leer `CLAUDE.md` y `CLAUDE.project.md` completos antes de empezar cualquier tarea.
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

El directorio `.agent/` en la raíz del proyecto es el espacio de trabajo compartido entre agentes.
Debe estar commiteado en el repositorio. Los agentes lo leen y escriben, el usuario lo consulta.

```
.agent/
├── BACKLOG.md         # Inbox del usuario: peticiones de features/bugs (usuario escribe, orquestador procesa)
├── TASKS.md           # Tablón de tareas: pendiente / en progreso / interrumpida / completada
├── DECISIONS.md       # Registro de decisiones técnicas autónomas del orquestador
├── BLOCKERS.md        # Impedimentos que requieren intervención del usuario
├── PROGRESS.md        # Resumen de progreso por fase para consulta rápida
└── ISSUES.md          # Incidencias de calidad abiertas por el agente de calidad de producto
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
4. **Orquestador ordena** las tareas según prioridad y dependencias al agente adecuado

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
## [FASE N] Nombre de la fase actual

### En progreso
| ID | Tarea | Agente | Branch | Inicio |
|----|-------|--------|--------|--------|
| T-001 | Descripción | nombre-agente | feature/nombre | YYYY-MM-DD |

### Pendiente
| ID | Tarea | Agente asignado | Dependencias | Notas |
|----|-------|----------------|--------------|-------|
| T-002 | Descripción | nombre-agente | T-001 | |
| T-003 | Descripción | nombre-agente | — | REINTENTAR |

### Interrumpida (agente caído con trabajo parcial)
| ID | Tarea | Branch | Último commit | Qué falta |
|----|-------|--------|--------------|-----------|
| T-004 | Descripción | feature/nombre | abc1234 | Descripción de lo que falta |

### Completada
| ID | Tarea | Branch mergeado | Fecha |
|----|-------|----------------|-------|
| T-000 | Descripción | develop | YYYY-MM-DD |
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
## Fase N — Estado general: EN PROGRESO

| Módulo | Completado | Total tareas | % |
|--------|-----------|-------------|---|
| módulo-a | 3 | 5 | 60% |
| módulo-b | 1 | 6 | 16% |

**Última actualización:** YYYY-MM-DD por orchestrator
```
